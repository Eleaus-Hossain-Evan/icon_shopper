import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../../common/presentation/product_list_tile.dart';
import '../application/product_provider.dart';

class ProductListScreen extends HookConsumerWidget {
  static const route = '/product-list';

  const ProductListScreen({
    super.key,
    required this.slug,
  });

  final String? slug;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool noDataMessageDisplayed =
        false; // Track if "No Data" message is displayed

    return Scaffold(
      appBar: KAppBar(
        titleText: slug ?? "All Products",
      ),
      body: ListView.custom(
        padding: padding16,
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            const pageSize = 8;

            final page = index ~/ pageSize + 1;
            final indexInPage = index % pageSize;
            final packageList = slug.isNotEmptyAndNotNull
                ? ref.watch(
                    categoryWiseProductProvider(slug: slug ?? "", page: page))
                : ref.watch(allProductProvider(page: page));

            if (packageList.when(
              data: (data) => data.isNotEmpty,
              loading: () => true,
              error: (err, stack) => false,
            )) {
              // Data is available, show the item

              return packageList.when(
                data: (data) {
                  if (indexInPage >= data.length) return null;

                  final product = data[indexInPage];
                  return ProductListTile(
                    data: product,
                    isLast: data.lastIndex == indexInPage,
                  );
                },
                error: (err, stack) {
                  log("error", error: err, stackTrace: stack);
                  return Text('Error $err');
                },
                loading: () => const ProductListShimmer(),
              );
            } else if (!noDataMessageDisplayed) {
              // Data is not available, and "No Data" message is not displayed yet
              noDataMessageDisplayed = true;
              return "No Data".text.lg.makeCentered();
            } else {
              // Data is not available, but "No Data" message is already displayed
              return null;
            }
          },
        ),
      ),
    );
  }
}

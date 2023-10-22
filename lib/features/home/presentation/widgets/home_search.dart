import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/core/app_ui/app_ui.dart';
import 'package:icon_shopper/features/common/presentation/product_grid_tile.dart';
import 'package:icon_shopper/features/common/presentation/product_list_tile.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';
import '../../application/home_provider.dart';

class HomeSearch extends SearchDelegate {
  final WidgetRef ref;

  HomeSearch(this.ref) : super(searchFieldLabel: 'Search Product');

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
              showSuggestions(context);
            }
          },
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) {
    return HookConsumer(
      builder: (context, ref, child) {
        bool noDataMessageDisplayed = false;
        return ListView.custom(
          padding: padding16,
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //   crossAxisCount: 2,
          //   crossAxisSpacing: 20.w,
          //   mainAxisSpacing: 18.w,
          //   childAspectRatio: 180 / 335,
          // ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              const pageSize = 15;

              final page = index ~/ pageSize + 1;
              final indexInPage = index % pageSize;
              final packageList =
                  ref.watch(searchProductProvider(query, page: page));

              if (packageList.when(
                data: (data) => data.data.isNotEmpty,
                loading: () => true,
                error: (err, stack) => false,
              )) {
                // Data is available, show the item

                return packageList.when(
                  data: (data) {
                    if (indexInPage >= data.data.length) return null;

                    final product = data.data[indexInPage];
                    return ProductListTile(
                      data: product,
                      isLast: data.data.lastIndex == indexInPage,
                    );
                  },
                  error: (err, stack) {
                    Logger.e(err);
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
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) => const SizedBox.shrink();
}

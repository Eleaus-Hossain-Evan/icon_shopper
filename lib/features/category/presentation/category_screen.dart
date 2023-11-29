import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../../home/application/home_provider.dart';
import '../../product/presentation/category_wise_product.dart';

class CategoryScreen extends HookConsumerWidget {
  static const route = '/category';

  const CategoryScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeDataProvider);

    final controller = useMemoized(RefreshController.new);
    return Scaffold(
      appBar: const KAppBar(
        titleText: 'Category',
      ),
      body: state.when(
        data: (data) {
          final expandIdex =
              useState(List.filled(data.categories.length, false));
          return StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                child: ExpansionPanelList(
                  expansionCallback: (index, isOpen) {
                    expandIdex.value[index] = isOpen;
                    Logger.i(
                        'index: $index, isExpand: $isOpen, expandList: $expandIdex');
                    setState(() {});
                  },
                  expandedHeaderPadding: EdgeInsets.zero,
                  materialGapSize: 0,
                  children: List.generate(
                    data.categories.length,
                    (index) {
                      final item = data.categories[index];
                      log('item: ${item.toString()}');

                      return ExpansionPanel(
                        isExpanded: expandIdex.value[index],
                        canTapOnHeader: true,
                        headerBuilder: (context, isOpen) {
                          return AspectRatio(
                            aspectRatio: 2,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          APIRouteEndpoint.IMAGE_BASE_URL +
                                              APIRouteEndpoint.PRODUCT_IMAGE +
                                              item.image,
                                        ),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                          Colors.black
                                              .withOpacity(isOpen ? 0.2 : 0.5),
                                          BlendMode.darken,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: item.name.text.bold.underline
                                        .heightLoose.wider.white.xl
                                        .textStyle(const TextStyle(
                                            decorationColor: Colors.white))
                                        .makeCentered(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        body: Column(
                          children:
                              List.generate(item.subCategories.length, (index) {
                            final subItem = item.subCategories[index];
                            return ListTile(
                                onTap: () {
                                  context.push(
                                    "${CategoryWiseProductScreen.route}/${subItem.slug}",
                                  );
                                },
                                title: subItem.name.text.make(),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.sp,
                                ),
                                leading: KCachedNetworkImageWdLoading(
                                  imageUrl: subItem.image,
                                  fit: BoxFit.fill,
                                  width: 100.w,
                                  height: 50.w,
                                ));
                          }),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
        error: (error, stackTrace) {
          log(error.toString(), error: error, stackTrace: stackTrace);
          return Text(error.toString());
        },
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../../product/provider/product_provider.dart';

class CategoryWiseProductScreen extends HookConsumerWidget {
  static const route = '/category-wise-product';

  const CategoryWiseProductScreen({
    super.key,
    required this.slug,
  });

  final String slug;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool noDataMessageDisplayed =
        false; // Track if "No Data" message is displayed

    return Scaffold(
      appBar: KAppBar(
        titleText: slug,
      ),
      body: ListView.custom(
        padding: padding16,
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            const pageSize = 8;

            final page = index ~/ pageSize + 1;
            final indexInPage = index % pageSize;
            final packageList =
                ref.watch(categoryWiseProductProvider(slug: slug, page: page));

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
                  return Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 384 / 572,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: KCachedNetworkImageWdLoading(
                                imageUrl: product.image.first,
                              ),
                            ),
                            Positioned(
                              top: 16.h,
                              left: 16.w,
                              child: Visibility(
                                visible: product.newArrivalStatus == 1,
                                child: "New"
                                    .text
                                    .bold
                                    .underline
                                    .heightLoose
                                    .white
                                    .wide
                                    .size(14.sp)
                                    .make()
                                    .pSymmetric(
                                        h: AppSpacing.md, v: AppSpacing.xxs)
                                    .box
                                    .customRounded(radius4)
                                    .color(const Color(0xFF1F2937))
                                    .make(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      gap26,
                      product.productName.text
                          .letterSpacing(1.6)
                          .size(16.sp)
                          .make(),
                      gap10,
                      Text.rich(
                        TextSpan(
                          children: [
                            '৳ '.textSpan.semiBold.size(16.sp).make(),
                            product.productVariants.first.regularPrice
                                .toString()
                                .textSpan
                                .semiBold
                                .size(16.sp)
                                .make()
                          ],
                        ),
                      ),
                      // product.toString().text.make(),

                      gap16,
                      data.lastIndex == indexInPage
                          ? const SizedBox.shrink()
                          : const KDivider(
                              color: AppColors.bg200,
                              thickness: 2.5,
                            ).pOnly(bottom: 16),
                    ],
                  );
                },
                error: (err, stack) {
                  Logger.e(err);
                  return Text('Error $err');
                },
                loading: () => Column(
                  children: [
                    const AspectRatio(
                      aspectRatio: 384 / 572,
                      child: VxSkeleton(),
                    ),
                    gap26,
                    const PackageItemShimmer(),
                    gap6,
                    const KDivider(
                      color: AppColors.bg200,
                      thickness: 2.5,
                    ).pOnly(bottom: 16),
                  ],
                ),
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

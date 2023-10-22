import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
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
    // final state = ref.watch(categoryWiseProductProvider(slug, page: 1));
    return Scaffold(
      appBar: KAppBar(
        titleText: slug,
      ),
      body: ListView.custom(
        padding: padding16,
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            const pageSize = 10;

            final page = index ~/ pageSize + 1;
            final indexInPage = index % pageSize;
            final packageList = ref.watch(
              categoryWiseProductProvider(slug: slug, page: page),
            );

            if (packageList.value != null && packageList.value!.isEmpty) {
              return "No Data".text.lg.makeCentered();
            }

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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

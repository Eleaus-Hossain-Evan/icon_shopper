import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../../product/application/product_provider.dart';
import '../../product/domain/model/product_model.dart';
import '../../product/presentation/product_detail/product_detail_screen.dart';

class ProductListTile extends HookConsumerWidget {
  const ProductListTile({
    super.key,
    required this.data,
    required this.isLast,
  });

  final ProductModel data;
  final bool isLast;

  @override
  Widget build(BuildContext context, ref) {
    final hasVariation =
        data.productVariationStatus == 1; //' product has variation or not

    //' regular price, if product has variation then showing variant regular price,
    //' otherwise showing product regular price
    final regularPrice = hasVariation
        ? data.productVariants?.first.regularPrice ?? 0
        : data.regularPrice;

    //' discount
    final discount = hasVariation
        ? data.productVariants?.first.discount ?? 0
        : data.discount;

    //' discount price
    final discountPrice = hasVariation
        ? data.productVariants?.first.salePrice ?? 0
        : data.salePrice;
    return KInkWell(
      onTap: () {
        ref.read(slugProvider.notifier).update((state) => data.slug);
        context.push("${ProductDetailScreen.route}/${data.slug}");
      },
      child: Column(
        children: [
          gap16,
          AspectRatio(
            aspectRatio: 384 / 572,
            child: Stack(
              children: [
                Positioned.fill(
                  child: KCachedNetworkImageWdLoading(
                    imageUrl: data.image.first,
                  ),
                ),
                Positioned(
                  top: 16.h,
                  left: 16.w,
                  child: Visibility(
                    visible: data.newArrivalStatus == 1,
                    child: "New"
                        .text
                        .bold
                        .underline
                        .heightLoose
                        .white
                        .wide
                        .size(14.sp)
                        .make()
                        .pSymmetric(h: AppSpacing.md, v: AppSpacing.xxs)
                        .box
                        .customRounded(radius4)
                        .color(const Color(0xFF1F2937))
                        .make(),
                  ),
                ),
              ],
            ),
          ),
          gap6,
          data.productName.text.letterSpacing(1.6).size(16.sp).make(),
          gap6,
          Row(
            mainAxisAlignment: mainCenter,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    '৳ '
                        .textSpan
                        .semiBold
                        .size((14 - 4).sp)
                        .lineThrough
                        .color(AppColors.black600)
                        .make(),
                    regularPrice
                        .toString()
                        .textSpan
                        .semiBold
                        .color(AppColors.black600)
                        .size(12.sp)
                        .lineThrough
                        .make(),
                  ],
                ),
              ).hide(isVisible: discount > 0),
              SizedBox(
                width: 4.w,
              ).hide(isVisible: discount > 0),
              Text.rich(
                TextSpan(
                  children: [
                    '৳ '
                        .textSpan
                        .semiBold
                        .size(14.sp)
                        .color(AppColors.primary200)
                        .make(),
                    discountPrice
                        .toString()
                        .textSpan
                        .semiBold
                        .size(14.sp)
                        .color(AppColors.primary200)
                        .make()
                  ],
                ),
              ),
            ],
          ),
          // product.toString().text.make(),

          gap16,
          isLast
              ? const SizedBox.shrink()
              : const KDivider(
                  color: AppColors.bg200,
                  thickness: 2.5,
                ),
        ],
      ),
    );
  }
}

class ProductListShimmer extends StatelessWidget {
  const ProductListShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

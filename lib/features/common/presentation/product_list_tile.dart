import 'dart:developer';

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
    return KInkWell(
      onTap: () {
        log("message");
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
          gap26,
          data.productName.text.letterSpacing(1.6).size(16.sp).make(),
          gap10,
          Text.rich(
            TextSpan(
              children: [
                '৳ '.textSpan.semiBold.size(16.sp).make(),
                data.productVariants.first.regularPrice
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

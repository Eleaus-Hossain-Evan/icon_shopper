import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../../product/domain/model/product_model.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    return KInkWell(
      onTap: () {
        log("message");
        // context.push(
        //     "${CategoryWiseProductScreen.route}/${item.asData?.value.slug}");
      },
      child: Column(
        children: [
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
                  top: 8.h,
                  left: 8.w,
                  child: Visibility(
                    visible: data.newArrivalStatus == 1,
                    child: "New"
                        .text
                        .xs
                        .bold
                        .underline
                        .heightLoose
                        .white
                        .wide
                        .size(14.sp)
                        .make()
                        .pSymmetric(h: AppSpacing.sm, v: AppSpacing.xxxs)
                        .box
                        .customRounded(radius4)
                        .color(const Color(0xFF1F2937))
                        .make(),
                  ),
                ),
              ],
            ),
          ),
          gap12,
          data.productName.text
              .letterSpacing(.8)
              .maxLines(1)
              .ellipsis
              .size(16.sp)
              .isIntrinsic
              .make(),
          // gap10,
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
        ],
      ),
    );
  }
}

class ProductGridShimmer extends StatelessWidget {
  const ProductGridShimmer({
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
        gap12,
        VxSkeleton(height: 12.h),
        gap12,
        VxSkeleton(height: 16.h),
      ],
    );
  }
}

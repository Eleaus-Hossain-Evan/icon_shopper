import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../../product/domain/model/product_model.dart';
import '../../product/presentation/product_detail/product_detail_screen.dart';

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
        context.push("${ProductDetailScreen.route}/${data.slug}");
      },
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 384 / 572,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Ink(
                    color: Colors.transparent,
                    child: KCachedNetworkImageWdLoading(
                      imageUrl: data.image.first,
                    ),
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

          // Row(
          //   children: [
          //     Row(
          //       children: [
          //         "TK".text.xl.bold.gray400.lineThrough.make(),
          //         gap2,
          //         variant.regularPrice.text.xl.bold.gray400.lineThrough.make(),
          //         gap8,
          //       ],
          //     ).hide(isVisible: variant.discount > 0),
          //     "TK".text.xl2.colorPrimary(context).bold.make(),
          //     gap2,
          //     (variant.salePrice).text.xl2.bold.colorPrimary(context).make(),
          //   ],
          // ),
          Row(
            mainAxisAlignment: mainCenter,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    '৳ '
                        .textSpan
                        .semiBold
                        .size(12.sp)
                        .lineThrough
                        .color(AppColors.primary200)
                        .make(),
                    data.productVariants.first.regularPrice
                        .toString()
                        .textSpan
                        .semiBold
                        .size(12.sp)
                        .lineThrough
                        .color(AppColors.primary200)
                        .make(),
                  ],
                ),
              ).hide(isVisible: data.productVariants.first.discount > 0),
              SizedBox(
                width: 4.w,
              ).hide(isVisible: data.productVariants.first.discount > 0),
              Text.rich(
                TextSpan(
                  children: [
                    '৳ '.textSpan.semiBold.size(16.sp).make(),
                    data.productVariants.first.salePrice
                        .toString()
                        .textSpan
                        .semiBold
                        .size(16.sp)
                        .make()
                  ],
                ),
              ),
            ],
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

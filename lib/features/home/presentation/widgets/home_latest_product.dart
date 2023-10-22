import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/core/app_ui/app_ui.dart';
import 'package:icon_shopper/core/constant/constant.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../application/home_provider.dart';

class HomeLatestProductWidget extends HookConsumerWidget {
  const HomeLatestProductWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      children: [
        Gap(42.h),
        "Latest Products".text.xl4.wide.makeCentered(),
        Gap(15.h),
        GridView.builder(
          padding: paddingH20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 18,
            childAspectRatio: 180 / 335,
          ),
          itemCount: ref
                  .watch(homeDataProvider)
                  .whenData((value) => value.newArrival)
                  .valueOrNull
                  ?.data
                  .length ??
              4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final item = ref
                .watch(homeDataProvider)
                .whenData((value) => value.newArrival.data[index]);

            return item.when(
              data: (data) => KInkWell(
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
                                  .pSymmetric(
                                      h: AppSpacing.sm, v: AppSpacing.xxxs)
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
                    data.productName.text.letterSpacing(.8).size(16.sp).make(),
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
              ),
              error: (error, stackTrace) {
                log(error.toString(), stackTrace: stackTrace);
                return Text(error.toString());
              },
              loading: () => Column(
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
              ),
            );
          },
        ),
        gap20,
        "View All Product"
            .text
            .xl2
            .semiBold
            .underline
            .letterSpacing(.8)
            .makeCentered(),
        Gap(45.h),
      ],
    ).color(AppColors.bg200);
  }
}

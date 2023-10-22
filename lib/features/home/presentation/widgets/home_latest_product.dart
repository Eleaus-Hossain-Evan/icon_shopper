import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:icon_shopper/core/app_ui/app_ui.dart';
import 'package:icon_shopper/core/constant/constant.dart';
import 'package:icon_shopper/features/product/domain/model/product_model.dart';

import '../../../common/presentation/product_grid_tile.dart';
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
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 18.w,
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
              data: (data) => ProductGridTile(data: data),
              error: (error, stackTrace) {
                log(error.toString(), stackTrace: stackTrace);
                return Text(error.toString());
              },
              loading: () => const ProductGridShimmer(),
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

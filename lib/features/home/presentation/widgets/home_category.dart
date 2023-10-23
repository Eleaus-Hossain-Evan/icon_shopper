import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/core/core.dart';
import 'package:icon_shopper/features/home/application/home_provider.dart';
import 'package:icon_shopper/features/product/presentation/category_wise_product.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeCategoryWidget extends HookConsumerWidget {
  const HomeCategoryWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: paddingH20,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 18.h,
          childAspectRatio: 1.4,
        ),
        itemBuilder: (context, index) {
          final item = ref
              .watch(homeDataProvider)
              .whenData((value) => value.categories.first.subCategories[index]);
          return item.when(
            data: (data) => KInkWell(
              onTap: () {
                log("message");
                context.push(
                    "${CategoryWiseProductScreen.route}/${item.asData?.value.slug}");
              },
              child: Stack(
                children: [
                  Positioned.fill(
                    child: KCachedNetworkImageWdLoading(
                      imageUrl: data.image,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.25),
                      ),
                      child: data
                          .name.text.bold.underline.heightLoose.white.wide
                          .size(14.sp)
                          .textStyle(
                              const TextStyle(decorationColor: Colors.white))
                          .makeCentered(),
                    ),
                  ),
                ],
              ),
            ),
            error: (error, stackTrace) {
              log(error.toString(), stackTrace: stackTrace);
              return Text(error.toString());
            },
            loading: () => const KShimmerWidget(),
          );
        },
        itemCount: ref
                .watch(homeDataProvider)
                .whenData((value) => value.categories.first.subCategories)
                .valueOrNull
                ?.length ??
            4,
      ),
    );
  }
}

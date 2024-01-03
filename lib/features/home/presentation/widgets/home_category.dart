import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';
import '../../../../features/home/application/home_provider.dart';
import '../../../product/presentation/product_list_screen.dart';

class HomeCategoryWidget extends HookConsumerWidget {
  const HomeCategoryWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(homeDataProvider);
    final categories =
        state.whenData((value) => value.categories.first.subCategories);
    return Padding(
      padding: paddingH20,
      child: categories.when(
        data: (data) => GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 18.h,
            childAspectRatio: 1.4,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return KInkWell(
              onTap: () {
                log("message");
                context.push("${ProductListScreen.route}?slug=${item.slug}");
              },
              child: Stack(
                children: [
                  Positioned.fill(
                    child: KCachedNetworkImageWdLoading(
                      imageUrl: item.image,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.25),
                      ),
                      child: item.name.text.bold.underline.heightLoose.white
                          .wide.center
                          .size(14.sp)
                          .textStyle(
                              const TextStyle(decorationColor: Colors.white))
                          .makeCentered(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 18.h,
            childAspectRatio: 1.4,
          ),
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) =>
              const KShimmerWidget(),
        ),
      ),
    );
  }
}


//  child: GridView.builder(
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 12.w,
//           mainAxisSpacing: 18.h,
//           childAspectRatio: 1.4,
//         ),
//         itemBuilder: (context, index) {
//           final item = state
//               .whenData((value) => value.categories.first.subCategories[index]);
//           return item.when(
//             data: (data) => KInkWell(
//               onTap: () {
//                 log("message");
//                 context.push(
//                     "${CategoryWiseProductScreen.route}/${item.asData?.value.slug}");
//               },
//               child: Stack(
//                 children: [
//                   Positioned.fill(
//                     child: KCachedNetworkImageWdLoading(
//                       imageUrl: data.image,
//                     ),
//                   ),
//                   Positioned.fill(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.25),
//                       ),
//                       child: data
//                           .name.text.bold.underline.heightLoose.white.wide
//                           .size(14.sp)
//                           .textStyle(
//                               const TextStyle(decorationColor: Colors.white))
//                           .makeCentered(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             error: (error, stackTrace) {
//               log(error.toString(), stackTrace: stackTrace);
//               return Text(error.toString());
//             },
//             loading: () => const KShimmerWidget(),
//           );
//         },
//         itemCount: ref
//                 .watch(homeDataProvider)
//                 .whenData((value) => value.categories.first.subCategories)
//                 .valueOrNull
//                 ?.length ??
//             4,
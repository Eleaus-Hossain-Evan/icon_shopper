import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/product/application/product_provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';
import 'widgets/product_app_bar.dart';
import 'widgets/product_image_section.dart';

class ProductDetailScreen extends HookConsumerWidget {
  static const route = '/product-detail';

  const ProductDetailScreen({
    super.key,
    required this.slug,
  });

  final String slug;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getProductDetailsProvider(slug));
    state.whenData((value) =>
        ref.read(currentProductProvider.notifier).setState(value.data));
    return Scaffold(
      // appBar: KAppBar(
      //   titleText: slug,
      // ),
      body: state.when(data: (data) {
        BotToast.closeAllLoading();
        return CustomScrollView(
          key: PageStorageKey<String>(slug),
          slivers: [
            // const SingleChildScrollView(
            //   child: Column(
            //     children: [],
            //   ),
            // ),
            const ProductAppBar(),

            const ProductImageSection().toSliverBox(),

            const Divider(
              color: AppColors.black300,
              
            ).toSliverBox(),

            const ProductPriceSection().toSliverBox(),

            SliverList.separated(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('list item $index'),
                );
              },
              itemCount: 50,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ],
        );
      }, error: (error, stackTrace) {
        log('', error: error, stackTrace: stackTrace);

        return error.toString().text.make();
      }, loading: () {
        BotToast.showLoading();
        return const SizedBox.shrink();
      }),
    );
  }
}

class ProductPriceSection extends HookConsumerWidget {
  const ProductPriceSection({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(currentProductProvider);
    final variant = state.productVariants[state.selectedVariantsIndex];

    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                "TK".text.xl4.bold.make(),
                gap8,
                variant.regularPrice.text.xl4.bold
                    .textStyle(
                      TextStyle(
                          decoration: variant.discount > 0
                              ? TextDecoration.lineThrough
                              : null),
                    )
                    .make(),
                gap8,
                (variant.regularPrice - variant.discount)
                    .text
                    .xl4
                    .bold
                    .textStyle(
                      TextStyle(
                          decoration: variant.discount > 0
                              ? TextDecoration.lineThrough
                              : null),
                    )
                    .when(variant.discount > 0)
                    .make(),
              ],
            ).expand(),
            gap12,
            Row(
              children: [
                "SKU:".text.bold.xl.make(),
                gap6,
                state.sku.text.xl.make(),
                MaterialButton(
                  onPressed: () {},
                  color: const Color(0xffe5e7eb),
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                  minWidth: 32.w,
                  // height: 40.h,
                  // highlightColor: context.colors.secondaryContainer.withOpacity(.2),
                  // hoverColor: context.colors.secondaryContainer,
                  // focusColor: context.colors.secondaryContainer,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  child: Icon(Icons.copy, size: 16.sp),
                ),
              ],
            )
          ],
        ),
      ],
    ).px16();
  }
}

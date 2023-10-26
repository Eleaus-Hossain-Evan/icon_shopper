import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/core.dart';
import '../../../application/product_provider.dart';

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

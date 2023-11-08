import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/core.dart';
import '../../../application/product_provider.dart';

class ProductPriceRatingSection extends HookConsumerWidget {
  const ProductPriceRatingSection({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(currentProductProvider);
    final variant = ref.watch(productVariantProvider);

    // return const SizedBox.shrink();

    return Column(
      children: [
        // Row(
        //   children: [
        //     KRatingWidget(rating: state.rating),
        //     gap8,
        //     "(${state.totalReviewer} customer reviews)".text.lg.make(),
        //   ],
        // ),
        gap8,
        Row(
          children: [
            "Price:".text.xl2.make(),
            gap4,
            Row(
              children: [
                Row(
                  children: [
                    "TK".text.xl.bold.gray400.lineThrough.make(),
                    gap2,
                    variant.regularPrice.text.xl.bold.gray400.lineThrough
                        .make(),
                    gap8,
                  ],
                ).hide(isVisible: variant.discount > 0),
                "TK".text.xl2.colorPrimary(context).bold.make(),
                gap2,
                (variant.salePrice).text.xl2.bold.colorPrimary(context).make(),
              ],
            ).expand(),
            gap12,
            Row(
              children: [
                "SKU:".text.bold.base.make(),
                gap6,
                state.sku.text.base.make(),
                MaterialButton(
                  onPressed: () {},
                  color: const Color(0xffe5e7eb),
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                  minWidth: 28.w,
                  // height: 40.h,
                  // highlightColor: context.colors.secondaryContainer.withOpacity(.2),
                  // hoverColor: context.colors.secondaryContainer,
                  // focusColor: context.colors.secondaryContainer,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  child: Icon(Icons.copy, size: 14.sp),
                ),
              ],
            )
          ],
        ),
      ],
    ).px16();
  }
}

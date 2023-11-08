import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/core/core.dart';
import 'package:icon_shopper/features/product/domain/model/product_variant_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../application/product_provider.dart';

class ProductVariationSection extends HookConsumerWidget {
  const ProductVariationSection({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(currentProductProvider);

    final variant = ref.watch(productVariantProvider);

    final attrib1stName = useMemoized(
        () => state.availableAttributes.isEmpty
            ? ""
            : state.availableAttributes[0].name,
        [state.availableAttributes]);

    return Padding(
      padding: paddingH16,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          "$attrib1stName :".text.xl2.make(),
          gap8,
          Wrap(
            runSpacing: 16.h,
            spacing: 16.w,
            children: List.generate(state.productVariants.length, (index) {
              final item = state.productVariants[index];

              final isSelected = variant.id == item.id;
              return OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  minimumSize: Size(56.w, 36.h),
                  // fixedSize: Size(56.w, 36.h),
                  backgroundColor: isSelected
                      ? context.colors.inverseSurface
                      : context.colors.surface,
                  foregroundColor: isSelected
                      ? context.colors.surface
                      : context.colors.inverseSurface,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                    // side: BorderSide(color: Colors.transparent),
                  ),
                ),
                onPressed: () {
                  ref
                      .read(productVariantProvider.notifier)
                      .update((state) => item);
                },
                child: item.productVariantName.text.bold.widest.make(),
              );
            }),
          ),
        ],
      ),
    );
  }
}

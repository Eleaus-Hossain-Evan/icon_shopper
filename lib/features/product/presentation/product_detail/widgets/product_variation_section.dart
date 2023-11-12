import 'package:bot_toast/bot_toast.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:icon_shopper/core/core.dart';
import 'package:icon_shopper/features/product/domain/model/product_model.dart';
import 'package:icon_shopper/features/product/domain/model/product_variant_model.dart';

import '../../../application/product_provider.dart';

class ProductVariationSection extends HookConsumerWidget {
  const ProductVariationSection({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(productNotifierProvider);

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
          "$attrib1stName :".text.xl.make(),
          gap8,
          ProductVariantList(
            currentVariant: variant,
            onTap: (item) => ref
                .read(productVariantProvider.notifier)
                .update((state) => item),
          ),
          gap24,
          "Product color may slightly vary, depending on your devices screen resolution"
              .text
              .center
              .thin
              .make()
              .px32(),
          gap18,
          Row(
            children: [
              "Share to :".text.lg.semiBold.center.make().pOnly(left: 16.w),
              gap8,
              IconButton.filled(
                onPressed: () {
                  ref.read(productNotifierProvider.notifier).copyProductUrl();
                },
                icon: const Icon(Icons.link_outlined),
              ),
              IconButton.filled(
                onPressed: () {
                  ref.read(productNotifierProvider.notifier).shareToFB();
                },
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xff0ea5e9),
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(EvaIcons.facebook),
              ),
            ],
          ),
          gap24,
          KInkWell(
            onTap: () => showCustomDialog(
              context: context,
              child: const CheckProductStockWidget(),
            ),
            child: "CHECK IN STORE AVAILABILITY"
                .text
                .lg
                .extraBold
                .underline
                .center
                .makeCentered(),
          ),
        ],
      ),
    );
  }
}

class ProductVariantList extends HookConsumerWidget {
  const ProductVariantList({
    super.key,
    required this.onTap,
    required this.currentVariant,
    this.minimumSize,
    this.fontWeight,
    this.fontSize,
    this.runSpacing,
    this.spacing,
  });

  final Function(ProductVariantModel) onTap;
  final ProductVariantModel? currentVariant;
  final Size? minimumSize;

  final FontWeight? fontWeight;
  final double? fontSize;
  final double? runSpacing;
  final double? spacing;

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(productNotifierProvider);

    return Wrap(
      runSpacing: runSpacing ?? 16.h,
      spacing: spacing ?? 16.w,
      children: List.generate(state.productVariants.length, (index) {
        final item = state.productVariants[index];

        final isSelected = (currentVariant?.id ?? 0) == item.id;
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: minimumSize ?? Size(56.w, 36.h),
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
          onPressed: () => onTap(item),
          child: Text(
            item.productVariantName,
            style: TextStyle(
              fontWeight: fontWeight ?? FontWeight.bold,
              fontSize: fontSize ?? 14.sp,
            ),
          ),
        );
      }),
    );
  }
}

class CheckProductStockWidget extends HookConsumerWidget {
  const CheckProductStockWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(productNotifierProvider);

    final currentVariant = useState<ProductVariantModel?>(null);

    return Padding(
      padding: padding16,
      child: Column(
        mainAxisSize: mainMin,
        crossAxisAlignment: crossStart,
        children: [
          gap4,
          "CHECK IN-STORE AVAILABILITY".text.xl.extraBold.makeCentered(),
          gap16,
          Column(
            children: [
              'Please select size'.text.lg.semiBold.letterSpacing(.6).make(),
              gap4,
              ProductVariantList(
                currentVariant: currentVariant.value,
                onTap: (item) => currentVariant.value = item,
                minimumSize: Size(40.w, 32.h),
                runSpacing: 8.w,
                spacing: 8.w,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
            ],
          ).color(Vx.white).card.make(),
          gap14,
          KFilledButton(onPressed: () {}, text: 'CHECK AVAILABILITY')
        ],
      ),
    );
  }
}

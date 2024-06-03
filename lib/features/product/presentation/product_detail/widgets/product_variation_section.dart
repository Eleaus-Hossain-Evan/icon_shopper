import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/core.dart';
import '../../../../../features/product/domain/model/product_variant_model.dart';
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
          Visibility(
            visible: state.stockProducts.isNotEmpty &&
                state.stockProducts.first.total <= 0,
            replacement: Column(
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
              ],
            ),
            child: Center(
              child: "Out of Stock"
                  .text
                  .lg
                  .bold
                  .white
                  .make()
                  .pSymmetric(h: 8, v: 4)
                  .box
                  .color(AppColors.black.withOpacity(.3))
                  .make(),
            ),
          ),
          gap16,
          AnimatedSize(
            duration: 300.milliseconds,
            reverseDuration: 300.milliseconds,
            child: AnimatedSwitcher(
              duration: 300.milliseconds,
              child: (state.stockProducts.isNotEmpty &&
                          state.stockProducts.first.total > 0) &&
                      ref.watch(productVariantProvider).qty <= 0
                  ? "This Variation Out of Stock"
                      .text
                      .lg
                      .color(AppColors.error)
                      .bold
                      .make()
                      .pSymmetric(h: 8, v: 4)
                      .box
                      .color(AppColors.error.withOpacity(.2))
                      .make()
                  : const SizedBox.shrink(),
            ),
          ),
          gap12,
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

mixin currentContext {}

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
      children: List.generate(state.productVariants?.length ?? 0, (index) {
        final item = state.productVariants?[index];

        final isSelected = (currentVariant?.id ?? 0) == item?.id;
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
            item!.productVariantName,
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
    final currentVariant = useState<ProductVariantModel?>(null);

    final stock = ref.watch(productStockProvider);

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
              gap16,
              'Please select size'
                  .text
                  .lg
                  .semiBold
                  .letterSpacing(.6)
                  .make()
                  .objectCenterLeft()
                  .px16(),
              gap4,
              ProductVariantList(
                currentVariant: currentVariant.value,
                onTap: (item) => currentVariant.value = item,
                minimumSize: Size(38.w, 28.h),
                runSpacing: 8.w,
                spacing: 8.w,
                fontSize: 10.sp,
              ).px(12.w).w(1.sw),
            ],
          ).color(Vx.white).card.elevation(4).make(),
          gap14,
          KFilledButton(
            onPressed: currentVariant.value.isNotNull && stock.hasValue
                ? () => ref
                    .read(productStockProvider.notifier)
                    .getStock(currentVariant.value!.productCode)
                : null,
            loading: stock.isLoading,
            text: 'CHECK AVAILABILITY',
          ),
          gap16,
          stock.when(
            data: (data) => data.isEmpty
                ? const SizedBox.shrink()
                : Table(
                    border: TableBorder.all(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                    children: [
                      TableRow(
                        children: [
                          "Name".text.lg.semiBold.make().p4(),
                          "Address".text.lg.semiBold.make().p4(),
                        ],
                      ),
                      ...data.map(
                        (e) => TableRow(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          children: [
                            e.name.text.heightLoose.make().p4(),
                            e.address.text.heightLoose.make().p4(),
                          ],
                        ),
                      )
                    ],
                  ),
            loading: () => const SizedBox.shrink(),
            error: (error, stackTrace) {
              log('', error: error, stackTrace: stackTrace);
              return error.toString().text.make();
            },
          )
        ],
      ),
    );
  }
}

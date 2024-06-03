import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactiveviewer_gallery/hero_dialog_route.dart';
import 'package:interactiveviewer_gallery/interactiveviewer_gallery.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/core.dart';
import '../../../application/product_provider.dart';

class ProductImageSection extends HookConsumerWidget {
  const ProductImageSection({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(productNotifierProvider);

    final controller = useMemoized(SwiperController.new);

    final currentVariation = useMemoized(() => state.selectedVariant,
        [state.productVariants, state.selectedVariant]);

    final percent = 100 *
        (currentVariation.regularPrice - currentVariation.salePrice) /
        currentVariation.regularPrice;
    void openGallery(String source) {
      Navigator.of(context).push(
        HeroDialogRoute<void>(
          // DisplayGesture is just debug, please remove it when use
          builder: (BuildContext context) => InteractiveviewerGallery<String>(
            sources: state.image,
            initIndex: state.image.indexOf(source),
            itemBuilder: (BuildContext context, int index, bool isFocus) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.of(context).pop(),
                child: Center(
                  child: state.image[index].networkImageBaseUrl(
                    fit: BoxFit.contain,
                    height: null,
                    width: 1.sw,
                  ),
                ),
              );
            },
            onPageChanged: (int pageIndex) {
              debugPrint("nell-pageIndex:$pageIndex");
            },
          ),
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          width: 1.sw,
          height: 200.h,
          child: Stack(
            children: [
              Swiper(
                controller: controller,
                itemCount: state.image.length,
                itemBuilder: (context, index) => AspectRatio(
                  aspectRatio: 384 / 572,
                  child: GestureDetector(
                    onTap: () => openGallery(state.image[index]),
                    child: state.image[index].networkImageBaseUrl(
                      fit: BoxFit.fitHeight,
                      height: null,
                    ),
                  ),
                ),
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    color: context.colors.primaryContainer,
                    activeColor: context.colors.secondary,
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: paddingH24,
                    child: Row(
                      children: [
                        IconButton.outlined(
                          highlightColor:
                              context.colors.secondary.withOpacity(.2),
                          onPressed: () {
                            controller.previous();
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        const Spacer(),
                        IconButton.outlined(
                          highlightColor:
                              context.colors.secondary.withOpacity(.2),
                          onPressed: () {
                            controller.next();
                          },
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                left: 18.w,
                child: Visibility(
                  visible: percent > 0,
                  child: "${percent.toDoubleStringAsFixed(digit: 1)}%"
                      .text
                      .xs
                      .bold
                      .white
                      .wide
                      .size(16.sp)
                      .make()
                      .pSymmetric(h: AppSpacing.sm, v: AppSpacing.xxxs)
                      .box
                      .customRounded(radius4)
                      .colorPrimary(context)
                      .make(),
                ),
              ),
              Positioned(
                top: percent > 0 ? 32.h : 8.h,
                left: 18.w,
                child: Visibility(
                  visible: true,
                  child: "New"
                      .text
                      .xs
                      .bold
                      .white
                      .wide
                      .size(16.sp)
                      .make()
                      .pSymmetric(h: AppSpacing.sm, v: AppSpacing.xxxs)
                      .box
                      .customRounded(radius4)
                      .colorPrimary(context)
                      .make(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 80.h,
          child: Center(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              separatorBuilder: (context, index) => gap4,
              itemBuilder: (context, index) {
                return KInkWell(
                  onTap: () => controller.move(index),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AspectRatio(
                      aspectRatio: 384 / 572,
                      child: state.image[index].networkImageBaseUrl(
                        fit: BoxFit.fitHeight,
                        isHero: false,
                      ),
                    ),
                  ),
                );
              },
              itemCount: state.image.length,
            ),
          ),
        ),
      ],
    );
  }
}

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
import '../../../domain/product_response.dart';

class ProductImageSection extends HookConsumerWidget {
  const ProductImageSection({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(currentProductProvider);

    final controller = useMemoized(SwiperController.new);

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
                  child: KCachedNetworkImage(
                    imageUrl: state.image[index],
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
            onPageChanged: (int pageIndex) {
              print("nell-pageIndex:$pageIndex");
            },
          ),
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: paddingH24,
          child: SizedBox(
            width: 1.sw,
            height: 300.h,
            child: Stack(
              children: [
                Swiper(
                  controller: controller,
                  itemCount: state.image.length,
                  itemBuilder: (context, index) => AspectRatio(
                    aspectRatio: 384 / 572,
                    child: GestureDetector(
                      onTap: () => openGallery(state.image[index]),
                      child: KCachedNetworkImage(
                        imageUrl: state.image[index],
                        fit: BoxFit.fitHeight,
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
                )
              ],
            ),
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
                      child: KCachedNetworkImageWdLoading(
                        imageUrl: state.image[index],
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

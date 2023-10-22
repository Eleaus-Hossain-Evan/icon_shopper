import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';
import '../../application/home_provider.dart';

class HomeSlider extends HookConsumerWidget {
  const HomeSlider({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeDataProvider);

    final currentIndex = useState(0);

    return AspectRatio(
      aspectRatio: 1355 / 516,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return state
                  .whenData((value) => value.slider.mapWithIndex((t, index) =>
                      KCachedNetworkImageNoBase(
                          imageUrl: APIRoute.BASE_URL +
                              APIRoute.IMAGE_SUBSTRING +
                              t.image)))
                  .asData
                  ?.value
                  .toList()[index] ??
              const KShimmerWidget();
        },
        itemCount:
            state.whenData((value) => value.slider.length).asData?.value ?? 1,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: context.colors.primaryContainer,
            activeColor: context.colors.secondary,
          ),
        ),
        // scale: .9,
        // viewportFraction: .85,
        autoplay: (state
                        .unwrapPrevious()
                        .whenData((value) => value.slider.length)
                        .asData
                        ?.value ??
                    0) <=
                1
            ? false
            : true,
        // outer: true,
        index: currentIndex.value,
        onIndexChanged: (value) => currentIndex.value = value,
      ),
    );
  }
}

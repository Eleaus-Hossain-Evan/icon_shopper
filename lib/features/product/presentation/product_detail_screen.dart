import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/product/application/product_provider.dart';
import 'package:icon_shopper/features/product/domain/model/product_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../../common/presentation/product_list_tile.dart';

class ProductDetailScreen extends HookConsumerWidget {
  static const route = '/product-detail';

  const ProductDetailScreen({
    super.key,
    required this.slug,
  });

  final String slug;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productDetailsProvider(slug));
    return Scaffold(
      // appBar: KAppBar(
      //   titleText: slug,
      // ),
      body: CustomScrollView(
        slivers: [
          // const SingleChildScrollView(
          //   child: Column(
          //     children: [],
          //   ),
          // ),
          SliverAppBar.medium(
            title: state.when(
              data: (data) => Text(data.data.productName),
              error: (err, stack) => Text('Error $err'),
              loading: () => KShimmerWidget(height: 36.h, width: 200.w),
            ),
            floating: true,
            pinned: true,
            snap: true,
          ),
          SliverToBoxAdapter(
            child: state.when(
              data: (data) => ProductImageSection(data: data.data),
              error: (err, stack) => Text('Error $err'),
              loading: () => Padding(
                padding: paddingH24,
                child: const ProductListShimmer(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductImageSection extends HookConsumerWidget {
  const ProductImageSection({
    super.key,
    required this.data,
  });

  final ProductModel data;

  @override
  Widget build(BuildContext context, ref) {
    // final selectImage = useState(data.image.first);
    // final state = ref.watch(productProvider(data.slug));
    final controller = useMemoized(SwiperController.new);
    // final currentIndex = useState(0);
    return Padding(
      padding: paddingH24,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 384 / 572,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Swiper(
                    controller: controller,
                    itemCount: data.image.length,
                    // index: currentIndex.value,
                    itemBuilder: (context, index) =>
                        KCachedNetworkImageWdLoading(
                      imageUrl: data.image[index],
                    ),
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        color: context.colors.primaryContainer,
                        activeColor: context.colors.secondary,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      IconButton.outlined(
                        onPressed: () {
                          controller.previous();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const Spacer(),
                      IconButton.outlined(
                        onPressed: () {
                          controller.next();
                        },
                        icon: const Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          gap24,
          SizedBox(
            height: 100.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return KInkWell(
                  onTap: () => controller.move(index),
                  child: KCachedNetworkImageWdLoading(
                    imageUrl: data.image[index],
                    height: 100.h,
                    width: 100.w,
                  ),
                );
              },
              itemCount: data.image.length,
            ),
          ),
        ],
      ),
    );
  }
}

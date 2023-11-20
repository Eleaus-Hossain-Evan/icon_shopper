import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/checkout/presentation/cart_screen.dart';
import 'package:icon_shopper/features/product/application/product_provider.dart';
import 'package:icon_shopper/features/product/presentation/product_detail/widgets/product_variation_section.dart';
import 'package:icon_shopper/features/product/presentation/product_detail/widgets/similar_product_section.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';
import '../../../common/presentation/go_to_cart_button.dart';
import '../../../profile/presentation/widgets/contact_info_widget.dart';
import 'widgets/product_cart_section.dart';
import 'widgets/product_image_section.dart';
import 'widgets/product_info_section.dart';
import 'widgets/product_name_section.dart';
import 'widgets/product_price_rating_scetion.dart';

class ProductDetailScreen extends HookConsumerWidget {
  static const route = '/product-detail';

  const ProductDetailScreen({
    super.key,
    required this.slug,
  });

  final String slug;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = useMemoized<GlobalKey<ScaffoldState>>(GlobalKey.new);

    final state = ref.watch(getProductDetailsProvider);

    useEffect(() {
      // Future.microtask(() => ref
      //     .read(currentProductProvider.notifier)
      //     .setState(state.value?.data));
      return () async =>
          await Future.microtask(() => ref.invalidate(productNotifierProvider));
    }, []);

    return Scaffold(
      key: scaffoldKey,
      endDrawer: const Drawer(child: CartScreen(fromProductDetail: true)),
      appBar: KAppBar(
        // titleText: slug,
        actions: [
          GoToCartButton(
            onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
          ),
        ],
      ),
      bottomNavigationBar: state.when(
        data: (data) => const ProductCartSection(),
        error: (error, stackTrace) => const SizedBox.shrink(),
        loading: () => const SizedBox.shrink(),
      ),
      body: state.when(data: (data) {
        // Future.microtask(() =>
        //     ref.read(currentProductProvider.notifier).setState(data.data));

        BotToast.closeAllLoading();
        return CustomScrollView(
          key: PageStorageKey<String>(slug),
          slivers: [
            // const SingleChildScrollView(
            //   child: Column(
            //     children: [],
            //   ),
            // ),
            // const ProductAppBar(),

            const ProductImageSection().toSliverBox(),

            SliverPersistentHeader(
              delegate: ProductNameSection(ref),
              pinned: true,
              floating: true,
            ),

            const ProductPriceRatingSection().toSliverBox(),

            SliverGap(12.h),

            const ProductVariationSection().toSliverBox(),

            SliverGap(12.h),

            // const ProductDescriptionSection().toSliverBox(),
            SliverGap(12.h),

            const ProductInfoSection().toSliverBox(),

            SliverGap(6.h),

            const Divider().toSliverBox(),

            SliverGap(6.h),

            const SimilarProductSection().toSliverBox(),

            SliverGap(6.h),

            const Divider().toSliverBox(),

            SliverGap(6.h),

            const ContactInfoWidget(inDetailScreen: true).px20().toSliverBox(),
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

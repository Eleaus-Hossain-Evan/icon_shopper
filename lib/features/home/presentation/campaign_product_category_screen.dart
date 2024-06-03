import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/home/application/home_provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../../common/presentation/product_grid_tile.dart';
import '../../product/presentation/product_list_screen.dart';

class CampaignProductCategoryScreen extends HookConsumerWidget {
  static const route = '/campaign_product_category';

  final String slug;

  const CampaignProductCategoryScreen({
    super.key,
    required this.slug,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(campaignDetailProvider(slug: slug));
    return Scaffold(
      appBar: KAppBar(
        titleText: slug,
      ),
      body: state.when(
          data: (data) => SingleChildScrollView(
                child: Column(
                  children: [
                    GridView.builder(
                      padding: paddingH20,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 18.h,
                        childAspectRatio: 1.4,
                      ),
                      itemCount: data.campaign_categories.length,
                      itemBuilder: (context, index) {
                        final item = data.campaign_categories[index];
                        return KInkWell(
                          onTap: () {
                            context.push(
                                "${ProductListScreen.route}?slug=${item.slug}");
                          },
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: KCachedNetworkImageWdLoading(
                                  imageUrl: item.image,
                                ),
                              ),
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.25),
                                  ),
                                  child: item.name.text.bold.underline
                                      .heightLoose.white.wide.center
                                      .size(14.sp)
                                      .textStyle(const TextStyle(
                                          decorationColor: Colors.white))
                                      .makeCentered(),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    gap20,
                    data.products.isEmpty
                        ? "No Product Found"
                            .text
                            .xl
                            .bold
                            .letterSpacing(1.2)
                            .makeCentered()
                            .p32()
                            .color(AppColors.bg300)
                        : GridView.builder(
                            padding: paddingH20,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20.w,
                              mainAxisSpacing: 18.w,
                              childAspectRatio: 180 / 335,
                            ),
                            itemCount: data.products.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              final item = data.products[index].product;
                              return ProductGridTile(data: item, );
                            },
                          ),
                  ],
                ),
              ),
          error: (error, stackTrace) {
            log(error.toString(), error: error, stackTrace: stackTrace);
            return Center(child: Text(error.toString()));
          },
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}

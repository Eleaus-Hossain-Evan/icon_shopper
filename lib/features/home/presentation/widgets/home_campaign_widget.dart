import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/core/core.dart';
import 'package:icon_shopper/features/home/presentation/campaign_product_category_screen.dart';

import '../../application/home_provider.dart';

class HomeCampaignWidget extends HookConsumerWidget {
  const HomeCampaignWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(getCampaignProvider);

    return state.whenOrNull(
          data: (data) => ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final campaign = data[index];
              return KInkWell(
                onTap: () {
                  context.push(
                      "${CampaignProductCategoryScreen.route}/${campaign.slug}");
                },
                child: Column(
                  children: [
                    KCachedNetworkImageNoBase(
                      imageUrl:
                          "${APIRouteEndpoint.BASE_URL}${APIRouteEndpoint.CAMPAIGN_IMAGE}${campaign.image}",
                      fit: BoxFit.fitWidth,
                      height: 200.h,
                    ),
                    Text(campaign.name),
                  ],
                ),
              );
            },
          ),
        ) ??
        const SizedBox.shrink();
  }
}

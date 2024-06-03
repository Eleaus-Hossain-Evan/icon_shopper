import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/core/core.dart';
import 'package:icon_shopper/features/home/presentation/campaign_product_category_screen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../application/home_provider.dart';

class HomeCampaignWidget extends HookConsumerWidget {
  const HomeCampaignWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(getCampaignProvider);

    return state.whenOrNull(
          data: (data) => Flex(
            direction: Axis.vertical,
            children: [
              KDivider(
                thickness: 2.h,
                color: Colors.grey.shade300,
                padding: paddingH16,
              ),
              "Running Campaign".text.xl4.make().pOnly(left: 16.w),
              gap16,
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final campaign = data[index];
                  return Visibility(
                    visible:
                        campaign.end_date.toDate()!.isAfter(DateTime.now()),
                    child: KInkWell(
                      onTap: () {
                        context.push(
                            "${CampaignProductCategoryScreen.route}/${campaign.slug}");
                      },
                      child: KCachedNetworkImageNoBase(
                        imageUrl:
                            "${APIRouteEndpoint.BASE_URL}${APIRouteEndpoint.CAMPAIGN_IMAGE}${campaign.image}",
                        fit: BoxFit.fitWidth,
                        height: 200.h,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ) ??
        const SizedBox.shrink();
  }
}

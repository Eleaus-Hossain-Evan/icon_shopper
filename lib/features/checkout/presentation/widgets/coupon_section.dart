
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';
import '../../domain/promo_data_model.dart';
import 'apply_coupon_widget.dart';

class CouponSection extends StatelessWidget {
  const CouponSection({
    super.key,
    required this.appliedPromo,
  });

  final ValueNotifier<PromoDataModel?> appliedPromo;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flex(
          direction: Axis.vertical,
          crossAxisAlignment: crossStart,
          children: [
            "Apply coupon".text.lg.bold.colorPrimary(context).make(),
            (appliedPromo.value?.name ?? "")
                .text
                .sm
                .bold
                .make()
                .hide(isVisible: appliedPromo.value != null)
          ],
        ).expand(),
        IconButton(
          onPressed: () {
            showCustomDialog(
              context: context,
              child: ApplyCouponWidget(
                onCouponApplied: (promo) =>
                    appliedPromo.value = PromoDataModel.data(),
              ),
            );
          },
          icon: Icon(
            BoxIcons.bxs_coupon,
            size: 24,
            color: context.colors.primary,
          ),
        ),
        (appliedPromo.value?.value.toString() ?? "").text.sm.bold.make(),
      ],
    );
  }
}

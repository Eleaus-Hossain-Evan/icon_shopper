import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/checkout/domain/promo_data_model.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';
import '../../application/checkout_provider.dart';

class ApplyCouponWidget extends HookConsumerWidget {
  const ApplyCouponWidget({
    super.key,
    required this.onCouponApplied,
  });

  final void Function(PromoDataModel?) onCouponApplied;

  @override
  Widget build(BuildContext context, ref) {
    final couponController = useTextEditingController();
    return Padding(
      padding: padding20,
      child: Column(
        mainAxisSize: mainMin,
        children: [
          Row(
            children: [
              AppStrings.enterCoupon.text.bold.make().expand(),
              const CloseButton(),
            ],
          ),
          KTextFormField2(
            controller: couponController,
            hintText: AppStrings.promoCodeEnter,
          ),
          gap20,
          ValueListenableBuilder(
              valueListenable: couponController,
              builder: (context, controller, child) {
                return KFilledButton(
                  loading: ref.watch(checkoutProvider).isLoading,
                  onPressed: controller.text.isEmpty
                      ? null
                      : () {
                          FocusScope.of(context).unfocus();
                          ref
                              .read(checkoutProvider.notifier)
                              .applyPromo(couponController.text)
                              .then(
                            (value) {
                              couponController.clear();
                              onCouponApplied(value);
                              Navigator.pop(context);
                            },
                          );
                        },
                  text: AppStrings.apply,
                );
              })
        ],
      ),
    );
  }
}

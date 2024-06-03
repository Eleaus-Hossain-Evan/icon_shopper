import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/main_mav/main_nav.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';

class OrderSuccessScreen extends HookConsumerWidget {
  static const route = '/order-success';

  const OrderSuccessScreen({
    super.key,
    required this.paymentMethod,
    required this.invoiceId,
    required this.totalPrice,
    required this.address,
  });

  final PaymentMethod paymentMethod;
  final String invoiceId;
  final String totalPrice;
  final String address;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const KAppBar(
        titleText: 'Order Success',
      ),
      body: SingleChildScrollView(
        padding: 20.paddingHorizontal,
        child: Column(
          crossAxisAlignment: crossCenter,
          children: [
            Gap(100.h),
            Icon(
              Icons.check_circle,
              color: AppColors.success,
              size: 60.sp,
            ),
            Gap(20.h),
            "Thank you, we have received your Order."
                .text
                .xl2
                .center
                .bold
                .makeCentered(),
            gap12,
            "Your order is placed with "
                .richText
                .withTextSpanChildren([
                  '${paymentMethod.name.toTitleCaseFromCamel()}.'
                      .textSpan
                      .bold
                      .make(),
                ])
                .center
                .letterSpacing(1.2)
                .lineHeight(1.5)
                .make(),
            "You will receive an SMS notification regarding the order."
                .text
                .center
                .letterSpacing(1.2)
                .lineHeight(1.5)
                .make(),
            gap12,
            "Your order ID is "
                .richText
                .withTextSpanChildren([
                  invoiceId.textSpan.bold.make(),
                  " and total value is ".textSpan.make(),
                  totalPrice.textSpan.bold.make(),
                ])
                .center
                .letterSpacing(1.2)
                .lineHeight(1.5)
                .make(),
            gap12,
            "Your shipping address is "
                .richText
                .withTextSpanChildren([
                  address.textSpan.bold.make(),
                ])
                .center
                .letterSpacing(1.2)
                .lineHeight(1.5)
                .make(),
            gap24,
            "Please remember, this information would be used for any kind of future inconvenience regarding your order."
                .text
                .center
                .letterSpacing(1.2)
                .lineHeight(1.5)
                .make(),
            gap48,
            KFilledButton(
              onPressed: () {
                context.pop();
                (MainNav.bottomNavigatorKey.currentWidget as NavigationBar)
                    .onDestinationSelected!(0);
              },
              text: 'Return to Home',
            ).px32()
          ],
        ),
      ),
    );
  }
}

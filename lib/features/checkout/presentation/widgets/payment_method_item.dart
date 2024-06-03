import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.image,
    required this.text,
    required this.selectedPayment,
  });

  final String image;
  final PaymentMethod text;
  final ValueNotifier<PaymentMethod> selectedPayment;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceOut,
      decoration: BoxDecoration(
        color: selectedPayment.value == text ? AppColors.white : null,
        borderRadius: BorderRadius.circular(7.5.r),
        border: Border.all(
            color:
                selectedPayment.value == text ? AppColors.success : Vx.gray300),
      ),
      child: KInkWell(
          onTap: () => selectedPayment.value = text,
          borderRadius: BorderRadius.circular(7.5.r),
          child: Column(
            children: [
              image.assetImage(
                height: 32.h,
                width: 40.w,
              ),
              gap4,
              text.name.toTitleCaseFromCamel().text.bold.make(),
            ],
          ).p8()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';
import '../../domain/delivery_charge_response.dart';

class ShippingTile extends StatelessWidget {
  const ShippingTile({
    super.key,
    required this.selectedShipping,
    this.onChanged,
    required this.model,
  });

  final ValueNotifier<DeliveryChargeModel?> selectedShipping;
  final void Function(DeliveryChargeModel?)? onChanged;
  final DeliveryChargeModel model;

  @override
  Widget build(BuildContext context) {
    return KInkWell(
      onTap: () {
        onChanged?.call(model);
      },
      child: "${model.name} "
          .richText
          .withTextSpanChildren(
            [
              "${AppStrings.tkSymbol}${model.value}"
                  .textSpan
                  .wide
                  .textStyle(
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700))
                  .make(),
            ],
          )
          .color(model == selectedShipping.value
              ? AppColors.white
              : context.colors.onSurface)
          .sm
          .make()
          .pSymmetric(v: 6.h, h: 8.w),
    )
        .animatedBox
        .milliSeconds(milliSec: 300)
        .border(color: context.colors.onSurface)
        .color(model == selectedShipping.value
            ? context.colors.onSurface
            : AppColors.white)
        .make();
  }
}

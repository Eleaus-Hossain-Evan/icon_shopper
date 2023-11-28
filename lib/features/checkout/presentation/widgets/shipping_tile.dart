import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';

class ShippingTile extends StatelessWidget {
  const ShippingTile({
    super.key,
    required this.selectedShipping,
    this.onChanged,
    required this.value,
  });

  final ValueNotifier<ShippingMethod> selectedShipping;
  final void Function(ShippingMethod?)? onChanged;
  final ShippingMethod value;

  @override
  Widget build(BuildContext context) {
    return KInkWell(
      onTap: () {
        onChanged?.call(value);
      },
      child: value.value.text.sm.bold
          .color(value == selectedShipping.value
              ? AppColors.white
              : context.colors.onSurface)
          .make()
          .pSymmetric(v: 4.h, h: 8.w),
    )
        .animatedBox
        .milliSeconds(milliSec: 300)
        .border(color: context.colors.onSurface)
        .color(value == selectedShipping.value
            ? context.colors.onSurface
            : AppColors.white)
        .make();
  }
}

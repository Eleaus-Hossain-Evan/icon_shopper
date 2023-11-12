import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer_count_down/timer_controller.dart';

import '../../core.dart';

showCustomDialog({
  required BuildContext context,
  required Widget child,
}) =>
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          clipBehavior: Clip.antiAlias,
          child: ColoredBox(
            color: Colors.white,
            child: child,
          ),
        );
      },
    );

Future<T?> showOTPDialog<T>({
  required BuildContext context,
  Function? onFinishedTimer,
  required void Function(String) onTapOtpCheck,
  CountdownController? controller,
  int length = 4,
  int duration = 120,
}) =>
    showDialog<T>(
      context: context,
      barrierDismissible: false,
      barrierLabel: "Barrier",
      useSafeArea: true,
      builder: (context) => Dialog(
        child: ColoredBox(
          color: AppColors.bg100,
          child: Padding(
            padding: EdgeInsets.all(22.w),
            child: OtpCheckWidget(
              controller: controller,
              duration: duration,
              length: length,
              onFinishedTimer: onFinishedTimer,
              onTapOtpCheck: onTapOtpCheck,
            ),
          ),
        ),
      ),
    );

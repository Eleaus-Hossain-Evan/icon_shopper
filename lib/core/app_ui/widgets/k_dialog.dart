import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core.dart';

showCustomDialog({
  required BuildContext context,
  required Widget child,
  bool barrierDismissible = false,
}) =>
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
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
              duration: duration,
              length: length,
              onFinishedTimer: onFinishedTimer,
              onTapOtpCheck: onTapOtpCheck,
            ),
          ),
        ),
      ),
    );

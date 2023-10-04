import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core.dart';
import 'k_button.dart';

class OtpCheckWidget extends HookConsumerWidget {
  const OtpCheckWidget({
    super.key,
    required this.onTapOtpCheck,
    this.controller,
    this.onFinishedTimer,
    this.length = 6,
    this.duration = 120,
  });

  final void Function(String) onTapOtpCheck;
  final CountdownController? controller;
  final Function? onFinishedTimer;
  final int length;
  final int duration;

  @override
  Widget build(BuildContext context, ref) {
    final otpController = useTextEditingController();
    final countController =
        controller ?? useMemoized(() => CountdownController(autoStart: true));

    final formKey = useMemoized(GlobalKey<FormState>.new);

    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
        color: AppColors.black,
        letterSpacing: 1.2,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.black400),
        borderRadius: BorderRadius.circular(6),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: context.colors.secondary,
        width: 1.4,
      ),
      borderRadius: BorderRadius.circular(12),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.success),
        color: context.colors.primaryContainer.withOpacity(.211),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(
          color: context.colors.error.withOpacity(.4),
          width: 1.4,
        ),
        color: context.colors.errorContainer.withOpacity(.2),
        borderRadius: BorderRadius.circular(18.r),
      ),
    );

    String formattedTime({required int timeInSecond}) {
      int sec = timeInSecond % 60;
      int min = (timeInSecond / 60).floor();
      String minute = min.toString().length <= 1 ? "0$min" : "$min";
      String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
      return "$minute : $second";
    }

    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: mainMin,
        children: [
          const Text(
            "Enter OTP",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          gap16,
          Pinput(
            controller: otpController,
            length: length,
            defaultPinTheme: defaultPinTheme,
            followingPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            errorPinTheme: errorPinTheme,
            // enabled: !isTimerFinished.value,
            validator: ValidationBuilder().required("Please enter OTP").build(),
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            showCursor: true,
            errorBuilder: (errorText, pin) => Padding(
              padding: padding6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    errorText!,
                    style: context.bodySmall!.copyWith(
                      color: context.colors.error,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
            onCompleted: (pin) => debugPrint(pin),
          ),
          gap16,
          Countdown(
            controller: countController,
            seconds: duration,
            build: (_, double time) =>
                formattedTime(timeInSecond: time.toInt()).text.bold.make(),
            onFinished: () {
              onFinishedTimer?.call();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Time is over!'),
                ),
              );
            },
          ),
          gap16,
          KFilledButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                onTapOtpCheck.call(otpController.text);
                // countController?.pause();
                log("otpController.length: ${otpController.length}");
              }
            },
            text: "Check OTP",
          ).px32(),
        ],
      ),
    );
  }
}

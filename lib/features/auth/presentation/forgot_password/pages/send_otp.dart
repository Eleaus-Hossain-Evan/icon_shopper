import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/core.dart';

class SendOTP extends HookConsumerWidget {
  const SendOTP({
    super.key,
    required this.phoneController,
    required this.token,
    required this.pageController,
  });

  final TextEditingController phoneController;
  final ValueNotifier<String> token;
  final PageController pageController;

  @override
  Widget build(BuildContext context, ref) {
    // Controller

    return SingleChildScrollView(
      child: ContainerBGWhiteSlideFromTop(
        margin: EdgeInsets.symmetric(horizontal: 32.w),
        bgColor: AppColors.bg200,
        child: Column(
          crossAxisAlignment: crossStart,
          mainAxisSize: MainAxisSize.min,
          children: [
            gap8,
            KTextFormField2(
              containerPadding: padding0,
              controller: phoneController,
              keyboardType: TextInputType.text,
              hintText: AppStrings.phoneNumber,
            ),
            gap24,
            KFilledButton(
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                // ref
                //     .read(authProvider.notifier)
                //     .forgotPassword(phoneController.text)
                //     .then((value) => value
                //         ? showDialog(
                //             context: context,
                //             barrierDismissible: false,
                //             barrierLabel: "Barrier",
                //             useSafeArea: true,
                //             builder: (context) => AlertDialog(
                //               content: OtpCheckWidget(
                //                 controller: controller,
                //                 onTapOtpCheck: (otp) async => ref
                //                     .read(authProvider.notifier)
                //                     .verifyOtp(otp)
                //                     .then((value) {
                //                   if (value.isNotBlank) {
                //                     token.value = value;
                //                     Navigator.pop(context);
                //                     pageController.nextPage(
                //                         duration: 500.milliseconds,
                //                         curve: Curves.easeIn);
                //                   }
                //                 }),
                //               ),
                //             ),
                //           )
                //         : null);
              },
              text: AppStrings.sendOtp,
            ),
          ],
        ),
      ),
    );
  }
}

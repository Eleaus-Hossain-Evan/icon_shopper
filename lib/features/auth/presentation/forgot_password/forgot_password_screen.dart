import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';
import '../../application/auth_provider.dart';
import 'pages/send_otp.dart';
import 'pages/verify_otp.dart';

class ForgotPasswordScreen extends HookConsumerWidget {
  static const route = '/forgot_password';

  const ForgotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = useState(false);

    final phoneController = useTextEditingController(text: "01956945283");

    final token = useState('');

    final pageController = usePageController();
    final isPageChnaged = useState(false);

    final currentPasswordController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final reNewPasswordController = useTextEditingController();

    final reNewPasswordFocus = useFocusNode();
    final newPasswordFocus = useFocusNode();

    final formKey = useMemoized(GlobalKey<FormState>.new);

    ref.listen(authProvider, (previous, next) {
      if (previous!.loading == false && next.loading) {
        // BotToast.showLoading();
        loading.value = true;
      }
      if (previous.loading == true && next.loading == false) {
        // BotToast.closeAllLoading();
        loading.value = false;
      }
    });

    return Scaffold(
      appBar: const KAppBar(),
      body: Column(
        crossAxisAlignment: crossStart,
        children: [
          // Gap(40.h),
          const AppLogoWidget(),
          gap48,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Text(
              AppStrings.forgotPassword.toTitleCase(),
              style: CustomTextStyles.sHeadlineLargeBold,
            ),
          ),
          gap8,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: AnimatedCrossFade(
              duration: 500.milliseconds,
              crossFadeState: CrossFadeState.showSecond,
              firstChild: Text(
                AppStrings.forgotBelowText1,
                style: CustomTextStyles.sf16Black900,
              ),
              secondChild: Text(
                AppStrings.forgotBelowText1,
                style: CustomTextStyles.sf16Black900,
              ),
            ),
          ),
          gap48,
          Flexible(
            child: PageView(
              controller: pageController,
              // physics: const NeverScrollableScrollPhysics(),
              children: [
                // 1st page

                SendOTP(
                  phoneController: phoneController,
                  token: token,
                  pageController: pageController,
                ),

                // 2nd page
                VerifyOTP(
                  formKey: formKey,
                  newPasswordController: newPasswordController,
                  newPasswordFocus: newPasswordFocus,
                  currentPasswordController: currentPasswordController,
                  reNewPasswordFocus: reNewPasswordFocus,
                  reNewPasswordController: reNewPasswordController,
                  loading: loading,
                  token: token,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../application/auth_provider.dart';
import '../domain/signup_body.dart';

class RegisterScreen extends HookConsumerWidget {
  static const route = '/register';

  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final nameController = useTextEditingController();
    final phoneController = useTextEditingController();
    final passwordController = useTextEditingController();
    final rePasswordController = useTextEditingController();

    final firstNameFocusNode = useFocusNode();
    final lastNameFocusNode = useFocusNode();
    final phoneFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();
    final rePasswordFocusNode = useFocusNode();

    ref.listen(authProvider, (previous, next) {
      if (previous!.loading == false && next.loading) {
        BotToast.showLoading();
      }
      if (previous.loading == true && next.loading == false) {
        BotToast.closeAllLoading();
      }
    });

    // Controller

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                Gap(20.h),

                //. App Logo
                const AppLogoWidget(),
                gap36,

                //. Sign Up Form
                ContainerBGWhiteSlideFromTop(
                  bgColor: AppColors.bg200,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: crossEnd,
                        children: [
                          Text(
                            AppStrings.register.toTitleCase(),
                            style: CustomTextStyles.sHeadline1,
                          ),
                          gap8,
                          AppStrings.toIconShopper.text
                              .textStyle(CustomTextStyles.sBodyRegular)
                              .make(),
                        ],
                      ),
                      gap6,

                      //. Sign Up instruction Text
                      AppStrings.signUpBelowText.text
                          .textStyle(
                            context.captionStyle!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              letterSpacing: .02,
                              color: AppColors.black600,
                            ),
                          )
                          .center
                          .make(),
                      gap24,

                      //. Name
                      KTextFormField2(
                        containerPadding: padding0,
                        focusNode: firstNameFocusNode,
                        hintText: AppStrings.name,
                        isLabel: true,
                        controller: nameController,
                        textInputAction: TextInputAction.next,
                        validator: ValidationBuilder()
                            .maxLength(25)
                            .required()
                            .build(),
                        onFieldSubmitted: (value) {
                          lastNameFocusNode.requestFocus();
                        },
                      ),
                      gap16,

                      //. Phone Number
                      KTextFormField2(
                        containerPadding: padding0,
                        hintText: AppStrings.phoneNumber,
                        isLabel: true,
                        controller: phoneController,
                        focusNode: phoneFocusNode,
                        keyboardType: TextInputType.phone,
                        validator: ValidationBuilder()
                            .maxLength(11)
                            .minLength(11)
                            .phone()
                            .required()
                            .build(),
                        onFieldSubmitted: (value) {
                          passwordFocusNode.requestFocus();
                        },
                      ),
                      gap16,

                      //. Password
                      KTextFormField2(
                        containerPadding: padding0,
                        hintText: AppStrings.password,
                        isLabel: true,
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                        isObscure: true,
                        validator: ValidationBuilder().minLength(6).build(),
                        onFieldSubmitted: (value) {
                          rePasswordFocusNode.requestFocus();
                        },
                      ),
                      gap16,

                      //. Re-type Password
                      KTextFormField2(
                        containerPadding: padding0,
                        controller: rePasswordController,
                        focusNode: rePasswordFocusNode,
                        hintText: AppStrings.reTypePassword,
                        isObscure: true,
                        validator:
                            ValidationBuilder().minLength(6).add((value) {
                          if (value != passwordController.text) {
                            return "Password doesn't match";
                          }
                          return null;
                        }).build(),
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                      gap16,

                      //. Privacy Policy disclaimer
                      Text(
                        AppStrings.signUpPrivacyPolicy,
                        textAlign: TextAlign.center,
                        style: context.captionStyle!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          letterSpacing: .02,
                          color: AppColors.black600,
                        ),
                      ),
                      gap18,

                      //. Register Button
                      KFilledButton(
                        onPressed: () async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          ref
                              .read(authProvider.notifier)
                              .register(
                                SignUpBody(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                ),
                              )
                              .then((value) {
                            if (value) {
                              showOTPDialog(
                                context: context,
                                onFinishedTimer: () => Navigator.pop(context),
                                onTapOtpCheck: (otp) async {
                                  ref
                                      .read(authProvider.notifier)
                                      .verifyOtp(otp)
                                      .then((value) {
                                    if (value) {
                                      Navigator.pop(context);
                                    }
                                  });
                                  Navigator.pop(context);
                                },
                              );
                            }
                          });
                        },
                        text: AppStrings.register,
                      ),
                    ],
                  ),
                ),
                gap28,

                //. going back to login page
                Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                      text: AppStrings.alreadyHaveAccount,
                      style: context.titleSmall!.copyWith(
                        color: AppColors.black600,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        const WidgetSpan(
                          child: SizedBox(
                            width: 12,
                          ),
                        ),
                        TextSpan(
                          text: AppStrings.login,
                          style: context.headlineMedium!.copyWith(
                            color: context.colors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => context.pop(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

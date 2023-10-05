import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/core.dart';
import '../../../application/auth_provider.dart';

class VerifyOTP extends HookConsumerWidget {
  const VerifyOTP({
    super.key,
    required this.formKey,
    required this.newPasswordController,
    required this.newPasswordFocus,
    required this.currentPasswordController,
    required this.reNewPasswordFocus,
    required this.reNewPasswordController,
    required this.loading,
    required this.token,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController newPasswordController;
  final FocusNode newPasswordFocus;
  final TextEditingController currentPasswordController;
  final FocusNode reNewPasswordFocus;
  final TextEditingController reNewPasswordController;
  final ValueNotifier<bool> loading;
  final ValueNotifier<String> token;

  @override
  Widget build(BuildContext context, ref) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: ContainerBGWhiteSlideFromRight(
          // padding: padding0,
          bgColor: AppColors.bg200,
          margin: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              KTextFormField2(
                hintText: AppStrings.newPassword,
                controller: newPasswordController,
                borderColor: AppColors.secondary,
                focusNode: newPasswordFocus,
                textInputAction: TextInputAction.next,
                validator: ValidationBuilder()
                    .required()
                    .minLength(6)
                    .maxLength(50)
                    .add((value) {
                  if (currentPasswordController.text ==
                      newPasswordController.text) {
                    return "Can't be same with current password";
                  }
                  return null;
                }).build(),
                onFieldSubmitted: (p0) {
                  reNewPasswordFocus.requestFocus();
                },
              ),
              gap16,
              KTextFormField2(
                hintText: AppStrings.reTypePassword,
                borderColor: AppColors.secondary,
                focusNode: reNewPasswordFocus,
                controller: reNewPasswordController,
                textInputAction: TextInputAction.done,
                validator: ValidationBuilder()
                    .required()
                    .minLength(6)
                    .maxLength(50)
                    .add((value) {
                  if (reNewPasswordController.text !=
                      newPasswordController.text) {
                    return AppStrings.notMatch;
                  }
                  return null;
                }).build(),
              ),
              gap16,
              SizedBox(
                width: 180.w,
                child: KFilledButton(
                  loading: loading.value,
                  onPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (formKey.currentState!.validate()) {
                      ref.read(authProvider.notifier).resetPassword(
                          newPasswordController.text, token.value);
                    }
                  },
                  backgroundColor: context.colors.secondary,
                  foregroundColor: AppColors.black100,
                  child: AppStrings.changePassword.text.base.make(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/profile/domain/change_password_body.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../../auth/application/auth_provider.dart';

class ChangePasswordScreen extends HookConsumerWidget {
  static const route = '/change-password';

  const ChangePasswordScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = useState(false);
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
      appBar: const KAppBar(
        titleText: AppStrings.changePassword,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ContainerBGWhiteSlideFromRight(
            bgColor: AppColors.bg200,
            child: Column(
              children: [
                KTextFormField2(
                  hintText: AppStrings.currentPassword,
                  controller: currentPasswordController,
                  textInputAction: TextInputAction.next,
                  validator: ValidationBuilder()
                      .required()
                      .minLength(6)
                      .maxLength(50)
                      .build(),
                  onFieldSubmitted: (p0) {
                    newPasswordFocus.requestFocus();
                  },
                ),
                gap16,
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
                  width: 100.w,
                  child: KFilledButton(
                    loading: loading.value,
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (formKey.currentState!.validate()) {
                        ref
                            .read(authProvider.notifier)
                            .passwordUpdate(ChangePasswordBody(
                              current_password: currentPasswordController.text,
                              password: newPasswordController.text,
                              password_confirmation:
                                  reNewPasswordController.text,
                            ));
                      }
                    },
                    text: '',
                    backgroundColor: context.colors.secondary,
                    foregroundColor: AppColors.white,
                    child: AppStrings.save.text.base.make(),
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

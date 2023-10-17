import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../../auth/application/auth_provider.dart';
import '../../common/presentation/html_text_screen.dart';
import 'change_password_screen.dart';
import 'widgets/contact_info_widget.dart';
import 'widgets/picture_widget.dart';

class ProfileScreen extends HookConsumerWidget {
  static const route = '/profile';

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final homeState = ref.watch(homeProvider);
    // final localState = ref.watch(appLocalProvider);
    // final isLoggedIn = ref.watch(loggedInProvider).loggedIn;

    //. -- Refresh Controller --
    final refreshController = useMemoized(
        () => RefreshController(initialLoadStatus: LoadStatus.canLoading));

    return Scaffold(
      appBar: const KAppBar(titleText: AppStrings.profile),
      body: SmartRefresher(
        controller: refreshController,
        onRefresh: () => ref
            .refresh(authProvider.notifier)
            .profileView()
            .then((_) => refreshController.refreshCompleted()),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              gap18,

              //.  --- profile detail section ---
              const ProfilePicWidget(),
              gap40,
              Container(
                padding: padding20,
                decoration: BoxDecoration(
                  color: AppColors.bg100,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: context.colors.primary.withOpacity(.2),
                    width: 1.2.w,
                  ),
                ),
                child: Column(
                  children: [
                    //.  --- password change section ---
                    ProfileOptionsItem(
                      leading: BoxIcons.bxs_lock,
                      title: AppStrings.changePassword,
                      onTap: () => context.push(ChangePasswordScreen.route),
                    ),
                    KDivider(height: 36.h),

                    //.  --- logout section ---
                    ProfileOptionsItem(
                      leading: EvaIcons.log_out,
                      title: AppStrings.logout,
                      onTap: () => kShowFloatBottomSheet(
                        context: context,
                        child: _LogoutDialog(
                          onYesPressed: () {
                            ref.read(authProvider.notifier).logout();
                            // context.go(LoginScreen.route);
                          },
                          onNoPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              gap18,
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: paddingLeft10,
                  child: Text(
                    AppStrings.support,
                    style: CustomTextStyles.s16w600Black900,
                  ),
                ),
              ),
              gap12,
              Container(
                padding: padding20,
                decoration: BoxDecoration(
                  color: AppColors.bg100,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(.2),
                    width: 1.2.w,
                  ),
                ),
                child: Column(
                  children: [
                    //.  --- term and condition ---

                    ProfileOptionsItem(
                      leading: Icons.privacy_tip_outlined,
                      title: AppStrings.termCondition,
                      onTap: () => context.push(
                          "${HtmlTextScreen.route}?title=${AppStrings.termCondition}&url=${APIRoute.TERMS_CONDITION}"),
                    ),
                    KDivider(height: 36.h),

                    //.  --- privacy policy section ---
                    ProfileOptionsItem(
                      leading: Icons.privacy_tip_outlined,
                      title: AppStrings.privacyPolicy,
                      onTap: () => context.push(
                          "${HtmlTextScreen.route}?title=${AppStrings.privacyPolicy}&url=${APIRoute.PRIVACY_POLICY}"),
                    ),
                    KDivider(height: 36.h),

                    //.  --- refund-policy ---
                    ProfileOptionsItem(
                      leading: Icons.privacy_tip_outlined,
                      title: AppStrings.refundPolicy,
                      onTap: () => context.push(
                          "${HtmlTextScreen.route}?title=${AppStrings.refundPolicy}&url=${APIRoute.REFUND_POLICY}"),
                    ),
                    KDivider(height: 36.h),

                    //.  --- return-policy ---
                    ProfileOptionsItem(
                      leading: Icons.privacy_tip_outlined,
                      title: AppStrings.returnPolicy,
                      onTap: () => context.push(
                          "${HtmlTextScreen.route}?title=${AppStrings.returnPolicy}&url=${APIRoute.RETURN_POLICY}"),
                    ),
                  ],
                ),
              ),

              gap28,

              //.  --- contact info section ---
              const ContactInfoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileOptionsItem extends HookConsumerWidget {
  const ProfileOptionsItem({
    super.key,
    required this.leading,
    required this.title,
    this.visible = true,
    this.trailingText,
    this.onTap,
    this.trailing,
    this.secondaryTrailing,
  });

  final IconData leading;
  final String title;
  final bool visible;
  final String? trailingText;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Widget? secondaryTrailing;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: visible,
      child: KInkWell(
        onTap: onTap,
        borderRadius: radius10,
        child: Row(
          children: [
            Icon(
              leading,
              size: 20.sp,
              color: AppColors.secondary,
            ),
            gap16,
            Expanded(
              child: Text(
                title,
                style: CustomTextStyles.s14w,
              ),
            ),
            trailing ??
                (secondaryTrailing ??
                    (trailingText == null
                        ? const SizedBox.shrink()
                        : Text(
                            trailingText ?? "",
                            style: CustomTextStyles.s14w500Red,
                          ))),
            gap12,
            trailing == null
                ? Icon(
                    Icons.chevron_right_rounded,
                    size: 28.sp,
                    color: AppColors.black,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class _LogoutDialog extends HookConsumerWidget {
  const _LogoutDialog({required this.onYesPressed, required this.onNoPressed});

  final VoidCallback onYesPressed;
  final VoidCallback onNoPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: mainMin,
        children: [
          SizedBox(
            height: 40.h,
          ),
          Text(
            AppStrings.logout,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Are you sure you want to logout?",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  // fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: .3.sw,
                  child: KFilledButton(
                    text: "Cancel",
                    onPressed: () {
                      Navigator.pop(context);
                      onNoPressed.call();
                    },
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    // foregroundColor:
                    //     Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                SizedBox(
                  width: .3.sw,
                  child: KFilledButton(
                    text: "Yes",
                    onPressed: () {
                      Navigator.pop(context);
                      onYesPressed.call();
                      // context.go(LoginScreen.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}

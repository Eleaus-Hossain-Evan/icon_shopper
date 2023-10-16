import 'package:velocity_x/velocity_x.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/core.dart';
import '../../../auth/application/auth_provider.dart';

class ProfilePicWidget extends HookConsumerWidget {
  const ProfilePicWidget({
    Key? key,
    required this.onEditTap,
  }) : super(key: key);

  final Function() onEditTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);

    return KInkWell(
      onTap: onEditTap,
      borderRadius: radius8,
      child: Row(
        children: [
          KUserAvatar(
            radius: 36.w,
            enableBorder: true,
            isHero: false,
          ),
          gap16,
          Expanded(
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                Text(
                  state.user.name,
                  style: CustomTextStyles.textStyle16w600,
                ),
                Visibility(
                  visible: state.user.email.isNotEmpty,
                  child: Text(
                    state.user.email,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.textStyle14w400B800,
                  ).pOnly(top: 4.h),
                ),
                gap4,
                Text(
                  state.user.phone,
                  style: CustomTextStyles.textStyle14w400B800,
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            size: 28.sp,
            color: AppColors.black,
          ),
        ],
      ).p20(),
    ).box.color(AppColors.bg100).shadowSm.roundedSM.make();
  }
}

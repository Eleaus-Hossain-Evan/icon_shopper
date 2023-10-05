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
      borderRadius: radius16,
      child: Container(
        padding: padding20,
        decoration: BoxDecoration(
          color: AppColors.bg100,
          borderRadius: radius16,
        ),
        child: Row(
          children: [
            KUserAvatar(
              imgUrl: state.user.avatar,
              radius: 36.w,
              enableBorder: true,
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
                  gap4,
                  Text(
                    state.user.email,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.textStyle14w400B800,
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
        ),
      ),
    );
  }
}

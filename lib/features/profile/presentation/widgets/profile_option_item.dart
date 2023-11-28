import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/core.dart';

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

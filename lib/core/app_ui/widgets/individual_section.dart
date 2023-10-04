import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core.dart';
import 'container_bg_white.dart';

class IndividualSection extends StatelessWidget {
  const IndividualSection({
    Key? key,
    required this.title,
    this.leading,
    this.visible = true,
    required this.child,
    this.replacement,
    this.containerPadding,
    this.action,
    this.bgColor = AppColors.bg100,
  }) : super(key: key);

  final String title;
  final Widget? leading, action;
  final bool visible;
  final Widget child;
  final Widget? replacement;
  final EdgeInsetsGeometry? containerPadding;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return ContainerBGWhiteSlideFromRight(
      padding: containerPadding,
      bgColor: bgColor,
      child: Column(
        children: [
          Row(
            children: [
              leading?.pOnly(right: 12.w, left: 8.w) ?? const SizedBox.shrink(),
              title.text.bold.lg.make().objectCenterLeft().flexible(),
              action ?? const SizedBox.shrink()
            ],
          ),
          gap16,
          child,
        ],
      ),
    ).box.color(AppColors.bg200).make();
  }
}

class IndividualSectionParcelTrack extends StatelessWidget {
  const IndividualSectionParcelTrack({
    Key? key,
    required this.title,
    this.leading,
    this.visible = true,
    required this.child,
    this.replacement,
    this.containerPadding,
    this.action,
  }) : super(key: key);

  final String title;
  final Widget? leading, action;
  final bool visible;
  final Widget child;
  final Widget? replacement;
  final EdgeInsetsGeometry? containerPadding;

  @override
  Widget build(BuildContext context) {
    return ContainerBGWhiteSlideFromRight(
      padding: padding0,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              margin: paddingTop12,
              decoration: BoxDecoration(
                color: AppColors.bg200,
                border: Border.all(
                  color: const Color(0xFF1C3011),
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          Padding(
            padding: paddingH16.copyWith(bottom: 12.h),
            child: Column(
              children: [
                title.text.extraBold.lg.white
                    .make()
                    .pSymmetric(v: 2.h, h: 22.w)
                    .box
                    .color(const Color(0xFF1C3011))
                    .rounded
                    .make()
                    .objectCenterLeft(),
                gap16,
                child,
              ],
            ),
          ),
        ],
      ),
    ).box.color(AppColors.bg200).make();
  }
}

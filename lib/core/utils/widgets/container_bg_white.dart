import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core.dart';

class ContainerBGWhiteSlideFromRight extends StatelessWidget {
  const ContainerBGWhiteSlideFromRight({
    Key? key,
    required this.child,
    this.padding,
    this.bgColor = AppColors.bg100,
    this.borderColor = AppColors.bg100,
    this.borderRadius,
    this.isBorder = false,
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color bgColor, borderColor;
  final BorderRadiusGeometry? borderRadius;
  final bool isBorder;
  @override
  Widget build(BuildContext context) {
    final border = isBorder
        ? Border.all(
            color: AppColors.primary.withOpacity(.1),
            width: 1.2.w,
          )
        : Border.all(
            color: borderColor,
            width: 1.2.w,
          );
    return FadeAnimation(
      intervalStart: 0.6,
      duration: const Duration(milliseconds: 400),
      child: Container(
        padding: padding ?? padding20,
        width: 1.sw,
        // margin: EdgeInsets.only(bottom: 28.h),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius ?? BorderRadius.circular(16.r),
          border: border,
        ),
        child: FadeAnimation(
          intervalStart: 0.5,
          duration: const Duration(milliseconds: 650),
          child: SlideAnimation(
            begin: const Offset(100, 0),
            intervalStart: 0.5,
            duration: const Duration(milliseconds: 650),
            child: child,
          ),
        ),
      ),
    );
  }
}

class ContainerBGWhiteSlideFromLeft extends StatelessWidget {
  const ContainerBGWhiteSlideFromLeft({
    Key? key,
    required this.child,
    this.padding,
    this.bgColor = AppColors.bg100,
    this.borderColor = AppColors.bg100,
    this.borderRadius,
    this.isBorder = false,
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color bgColor, borderColor;
  final BorderRadiusGeometry? borderRadius;
  final bool isBorder;
  @override
  Widget build(BuildContext context) {
    final border = isBorder
        ? Border.all(
            color: AppColors.primary.withOpacity(.1),
            width: 1.2.w,
          )
        : Border.all(
            color: borderColor,
            width: 1.2.w,
          );
    return FadeAnimation(
      intervalStart: 0.6,
      duration: const Duration(milliseconds: 400),
      child: Container(
        padding: padding ?? padding20,
        width: 1.sw,
        // margin: EdgeInsets.only(bottom: 28.h),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius ?? BorderRadius.circular(16.r),
          border: border,
        ),
        child: FadeAnimation(
          intervalStart: 0.5,
          duration: const Duration(milliseconds: 650),
          child: SlideAnimation(
            begin: const Offset(-100, 0),
            intervalStart: 0.5,
            duration: const Duration(milliseconds: 650),
            child: child,
          ),
        ),
      ),
    );
  }
}

class ContainerBGWhiteSlideFromTop extends StatelessWidget {
  const ContainerBGWhiteSlideFromTop({
    Key? key,
    required this.child,
    this.padding,
    this.bgColor = AppColors.bg100,
    this.borderRadius,
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color bgColor;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      intervalStart: 0.6,
      duration: const Duration(milliseconds: 400),
      child: Container(
        padding: padding ?? padding20,
        width: 1.sw,
        // margin: EdgeInsets.only(bottom: 28.h),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius ?? BorderRadius.circular(16.r),
          // border: Border.all(
          //   color: ColorPalate.primary.withOpacity(.1),
          //   width: 1.2.w,
          // ),
        ),
        child: FadeAnimation(
          intervalStart: 0.5,
          duration: const Duration(milliseconds: 650),
          child: SlideAnimation(
            begin: const Offset(0, -100),
            intervalStart: 0.5,
            duration: const Duration(milliseconds: 650),
            child: child,
          ),
        ),
      ),
    );
  }
}

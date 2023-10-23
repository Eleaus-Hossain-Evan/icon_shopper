import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class KInkWell extends StatelessWidget {
  const KInkWell({
    Key? key,
    required this.child,
    this.onTap,
    this.borderRadius,
    this.radius,
    this.rippleColor,
    this.padding,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  final void Function()? onTap;
  final Widget child;
  final BorderRadius? borderRadius;
  final double? radius;
  final Color? rippleColor, backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? Colors.transparent,
      borderRadius: borderRadius ?? BorderRadius.circular(4.r),
      child: InkWell(
        onTap: onTap,
        customBorder: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(4.r),
        ),
        // borderRadius: borderRadius ?? BorderRadius.zero,
        radius: radius,
        highlightColor: context.colors.onSecondary.withOpacity(.12),
        splashColor: rippleColor?.withOpacity(.12) ??
            context.colors.onSecondary.withOpacity(.12),
        // overlayColor: MaterialStateProperty.resolveWith((states) {
        //   if (states.contains(MaterialState.hovered)) {
        //     return rippleColor?.withOpacity(.12) ??
        //         context.color.onPrimaryContainer.withOpacity(0.12);
        //   }
        //   if (states.contains(MaterialState.focused)) {
        //     return rippleColor?.withOpacity(.12) ??
        //         context.color.onPrimaryContainer.withOpacity(0.12);
        //   }
        //   if (states.contains(MaterialState.pressed)) {
        //     return rippleColor?.withOpacity(.12) ??
        //         context.color.onPrimaryContainer.withOpacity(0.12);
        //   }
        //   if (states.contains(MaterialState.selected)) {
        //     return rippleColor?.withOpacity(.12) ??
        //         context.color.onPrimaryContainer.withOpacity(0.12);
        //   }
        //   return null;
        // }),
        child: Ink(
          padding: padding ?? EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(4.r),
          ),
          child: child,
        ),
      ),
    );
  }
}

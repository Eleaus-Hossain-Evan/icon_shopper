import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core.dart';
import 'k_inkwell.dart';

class KIconElevatedButton extends HookConsumerWidget {
  const KIconElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.loading = false,
  });

  final String text;
  final Widget icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback onPressed;
  final bool? loading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ButtonStyle(
        // shape: MaterialStateProperty.all(
        //   RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(10.r),
        //   ),
        // ),
        minimumSize: MaterialStateProperty.all(Size.fromHeight(55.h)),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        foregroundColor: MaterialStateProperty.all(foregroundColor),
      ),
      onPressed: onPressed,
      child: (loading != null && loading!)
          ? SizedBox(
              height: 30.h,
              width: 30.h,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  foregroundColor ?? Theme.of(context).colorScheme.secondary,
                ),
              ),
            )
          : Row(
              children: [
                Expanded(child: Center(child: Text(text))),
                Material(
                  elevation: 4,
                  color: backgroundColor ?? Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(100.r),
                  child: Padding(
                    padding: EdgeInsets.all(6.w),
                    child: icon,
                  ),
                ),
              ],
            ),
    );
  }
}

class KElevatedButton extends HookConsumerWidget {
  const KElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.loading,
    this.child,
    this.isSecondary,
    this.textStyle,
    this.size,
    this.padding,
  });

  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback? onPressed;
  final bool? loading;
  final Widget? child;
  final bool? isSecondary;
  final TextStyle? textStyle;
  final Size? size;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      // style: ButtonStyle(
      //   minimumSize: MaterialStateProperty.all(size ?? Size.fromHeight(55.h)),
      //   textStyle: MaterialStateProperty.all(textStyle),
      //   backgroundColor: MaterialStateProperty.resolveWith<Color>(
      //       (Set<MaterialState> states) {
      //     if (states.contains(MaterialState.disabled)) {
      //       return context.theme.disabledColor;
      //     }
      //     return backgroundColor ??
      //         (isSecondary
      //             ? context.color.secondary
      //             : context.color.primary); // Use the component's default.
      //   }),
      //   foregroundColor:
      //       MaterialStateProperty.all(foregroundColor ?? Colors.white),
      //   overlayColor: MaterialStateProperty.all(
      //     isSecondary ? context.color.secondary : context.color.primary,
      //   ),
      // ),
      style: ElevatedButton.styleFrom(
        textStyle: textStyle ??
            TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              // color: isSecondary == null
              //     ? AppColors.text200
              //     : (isSecondary!
              //         ? AppColors.secondary200
              //         : AppColors.primary300),
            ),
        foregroundColor: isSecondary == null
            ? AppColors.text200
            : (isSecondary! ? AppColors.secondary200 : AppColors.primary300),
        backgroundColor: backgroundColor ?? AppColors.white,
        padding: padding,
        minimumSize: size,
      ),
      onPressed: onPressed,
      child: (loading != null && loading!)
          ? SizedBox(
              height: 30.h,
              width: 30.h,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  isSecondary == null
                      ? AppColors.text200
                      : (isSecondary!
                          ? context.colors.onSecondaryContainer
                          : context.colors.onPrimaryContainer),
                ),
              ),
            )
          : child ??
              Text(
                text,
              ),
    );
  }
}

class KOutlinedButton extends HookConsumerWidget {
  const KOutlinedButton({
    super.key,
    this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor = AppColors.primary,
    this.borderWidth,
    required this.onPressed,
    this.loading,
    this.textStyle,
    this.size,
    this.isSecondary = true,
    this.child,
    this.borderSide,
    this.borderStyle,
    this.padding,
    this.shape,
    this.borderRadius = BorderRadius.zero,
  });

  final String? text;
  final Color? backgroundColor, foregroundColor;
  final Color borderColor;
  final double? borderWidth;
  final VoidCallback? onPressed;
  final ValueNotifier<bool>? loading;
  final TextStyle? textStyle;
  final Size? size;
  final bool isSecondary;
  final Widget? child;
  final BorderSide? borderSide;
  final BorderStyle? borderStyle;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? shape;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: padding,
        textStyle: textStyle ??
            TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: foregroundColor ??
                  (isSecondary ? AppColors.secondary : AppColors.primary),
            ),
        foregroundColor: foregroundColor ??
            (isSecondary ? AppColors.secondary : AppColors.primary),
        backgroundColor: backgroundColor,
        side: BorderSide(
          color: isSecondary ? AppColors.secondary : borderColor,
          width: borderWidth ?? 1,
          style: borderStyle ?? BorderStyle.solid,
        ),
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
        minimumSize: size,
      ),
      onPressed: onPressed,
      child: (loading != null && loading!.value)
          ? SizedBox(
              height: 30.h,
              width: 30.h,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  foregroundColor ?? Theme.of(context).colorScheme.secondary,
                ),
              ),
            )
          : child ?? Text(text ?? ''),
    );
  }
}

class KButton extends HookConsumerWidget {
  const KButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.loading,
    this.child,
  });

  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback? onPressed;
  final bool? loading;
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      // style: ButtonStyle(
      //   // shape: MaterialStateProperty.all(
      //   //   RoundedRectangleBorder(
      //   //     borderRadius: BorderRadius.circular(10.r),
      //   //   ),
      //   // ),
      //   // minimumSize: MaterialStateProperty.all(Size.fromHeight(55.h)),
      //   backgroundColor: MaterialStateProperty.all(backgroundColor),
      //   foregroundColor: MaterialStateProperty.all(foregroundColor),
      // ),

      onPressed: onPressed,
      child: (loading != null && loading!)
          ? SizedBox(
              height: 30.h,
              width: 30.h,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  foregroundColor ?? Theme.of(context).colorScheme.secondary,
                ),
              ),
            )
          : child ??
              Text(
                text,
              ),
    );
  }
}

class KFilledButton extends HookConsumerWidget {
  const KFilledButton({
    super.key,
    this.text = '',
    this.backgroundColor,
    this.foregroundColor,
    required this.onPressed,
    this.loading,
    this.child,
    this.isSecondary = false,
    this.textStyle,
    this.size,
    this.padding,
  });

  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback? onPressed;
  final bool? loading;
  final Widget? child;
  final bool isSecondary;
  final TextStyle? textStyle;
  final Size? size;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      // style: ButtonStyle(
      //   minimumSize: MaterialStateProperty.all(size ?? Size.fromHeight(55.h)),
      //   textStyle: MaterialStateProperty.all(textStyle),
      //   backgroundColor: MaterialStateProperty.resolveWith<Color>(
      //       (Set<MaterialState> states) {
      //     if (states.contains(MaterialState.disabled)) {
      //       return context.theme.disabledColor;
      //     }
      //     return backgroundColor ??
      //         (isSecondary
      //             ? context.color.secondary
      //             : context.color.primary); // Use the component's default.
      //   }),
      //   foregroundColor:
      //       MaterialStateProperty.all(foregroundColor ?? Colors.white),
      //   overlayColor: MaterialStateProperty.all(
      //     isSecondary ? context.color.secondary : context.color.primary,
      //   ),
      // ),
      style: FilledButton.styleFrom(
        textStyle: textStyle ??
            TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
        foregroundColor: foregroundColor ?? AppColors.bg200,
        backgroundColor: isSecondary ? AppColors.secondary : backgroundColor,
        // fixedSize: size ?? const Size.fromHeight(40),
        minimumSize: size,
        padding: padding,
      ),
      onPressed: onPressed,
      child: (loading != null && loading!)
          ? SizedBox(
              height: 20.h,
              width: 20.h,
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.bg200,
                ),
                strokeWidth: 2,
              ),
            )
          : child ??
              (text.isEmptyOrNull ? const SizedBox.shrink() : Text(text)),
    );
  }
}

class KCircularButton extends StatelessWidget {
  const KCircularButton({
    super.key,
    this.radius = 20,
    this.onTap,
    this.icon,
    this.bgColor,
  });

  final double radius;

  final VoidCallback? onTap;
  final Widget? icon;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(200.w),
      color: Colors.transparent,
      child: KInkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(200.w),
        padding: EdgeInsets.all(4.w),
        child: Ink(
          color: Colors.transparent,
          child: CircleAvatar(
            radius: radius,
            backgroundColor: Colors.transparent,
            child: icon,
          ),
        ),
      ),
    );
  }
}

class KTextButton extends StatelessWidget {
  const KTextButton({
    super.key,
    this.child,
    required this.onPressed,
    this.borderRadius = BorderRadius.zero,
    this.padding = EdgeInsets.zero,
    this.style,
    this.text,
    this.isSecondary,
    this.foregroundColor,
    this.backgroundColor,
  });

  final String? text;
  final Widget? child;
  final VoidCallback? onPressed;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry? padding;
  final ButtonStyle? style;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final bool? isSecondary;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: isSecondary == null
            ? foregroundColor
            : (isSecondary!
                ? context.colors.secondary
                : context.colors.primary),
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child:
          child ?? (text.isEmptyOrNull ? const SizedBox.shrink() : Text(text!)),
    );
  }
}

class KGradientButton extends StatelessWidget {
  const KGradientButton({
    super.key,
    this.text,
    this.child,
    required this.onPressed,
    this.borderRadius = BorderRadius.zero,
    this.padding = EdgeInsets.zero,
    this.style,
    this.foregroundColor,
    this.backgroundColor,
    this.isSecondary,
    this.gradient,
    this.colors,
  });

  final String? text;
  final Widget? child;
  final VoidCallback? onPressed;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry? padding;
  final ButtonStyle? style;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final bool? isSecondary;
  final Gradient? gradient;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.white,
        backgroundColor: backgroundColor,
        padding: padding0,
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
      onPressed: onPressed,
      child: Ink(
          height: context.theme.buttonTheme.height,
          decoration: BoxDecoration(
            color: onPressed == null ? Colors.blueGrey.shade200 : null,
            gradient: onPressed != null
                ? gradient ??
                    LinearGradient(
                      colors: colors ??
                          [
                            const Color(0xFFfb913b),
                            const Color(0xFFea590d),
                          ],
                    )
                : null,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: child ??
                (text.isEmptyOrNull ? const SizedBox.shrink() : Text(text!)),
          )),
    );
  }
}

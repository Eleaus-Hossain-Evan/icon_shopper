import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:velocity_x/velocity_x.dart';

kShowBottomSheet({
  required BuildContext context,
  required Widget child,
}) {
  return showMaterialModalBottomSheet(
    // expand: false,
    context: context,
    builder: (context) => child,
  );
}

kShowFloatBottomSheet({
  required BuildContext context,
  required Widget child,
}) =>
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      elevation: 0,
      builder: (context) => Container(
        // height: height,
        margin: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: child,
      ),
    );

kShowBarModalBottomSheet({
  required BuildContext context,
  required Widget child,
}) {
  return showBarModalBottomSheet(
    // expand: false,
    context: context,
    barrierColor: Colors.black38,
    builder: (context) => child,
  );
}

/// Modal which is styled for the Flutter News Example app.
Future<T?> showAppModal<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  RouteSettings? routeSettings,
  BoxConstraints? constraints,
  double? elevation,
  Color? barrierColor,
  Color? backgroundColor,
  bool isDismissible = true,
  bool enableDrag = true,
  AnimationController? transitionAnimationController,
}) {
  return showModalBottomSheet(
    context: context,
    builder: builder,
    routeSettings: routeSettings,
    constraints: constraints,
    isScrollControlled: true,
    barrierColor: barrierColor,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    transitionAnimationController: transitionAnimationController,
    elevation: elevation,
    backgroundColor: backgroundColor,
  );
}

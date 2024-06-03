import 'dart:core';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';

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

Future<T?> kShowFloatBottomSheet<T>({
  required BuildContext context,
  required Widget child,
}) async {
  final result = await showCustomModalBottomSheet(
      context: context,
      builder: (context) => child,
      useRootNavigator: true,
      duration: 300.milliseconds,
      containerWidget: (_, animation, child) => FloatingModal(
            child: child,
          ),
      expand: false);

  return result;
}

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
showAppModal<T>({
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
}) =>
    showModalBottomSheet<T>(
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

class FloatingModal extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  const FloatingModal({super.key, required this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: 20.padding,
        child: Material(
          color: backgroundColor,
          clipBehavior: Clip.antiAlias,
          borderRadius: 12.borderRadius,
          child: child,
        ),
      ),
    );
  }
}

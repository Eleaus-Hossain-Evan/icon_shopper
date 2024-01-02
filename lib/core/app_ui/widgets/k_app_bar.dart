import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KAppBar({
    super.key,
    this.leading,
    this.title,
    this.titleText,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.titleTextStyle,
    this.centerTitle = true,
    this.bottom,
    this.backgroundColor,
    this.elevation,
    this.foregroundColor = AppColors.black,
    this.surfaceTintColor,
  });

  final Widget? leading;
  final Widget? title;
  final String? titleText;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final TextStyle? titleTextStyle;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor, foregroundColor, surfaceTintColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor ?? Colors.transparent,
      foregroundColor: foregroundColor,
      leading: leading,
      // titleTextStyle: titleTextStyle,
      title: title ??
          (titleText.isNotEmptyAndNotNull
              ? Text(
                  titleText ?? "",
                  style: titleTextStyle,
                )
              : null),
      actions: actions,
      bottom: bottom,
      elevation: elevation,
      surfaceTintColor: surfaceTintColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      bottom == null ? kToolbarHeight : kToolbarHeight + kToolbarHeight);
}

class KAppBarBGTransparent extends StatelessWidget
    implements PreferredSizeWidget {
  const KAppBarBGTransparent({
    super.key,
    this.leading,
    this.title,
    this.titleText,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.titleTextStyle,
    this.centerTitle = true,
    this.bottom,
    this.backgroundColor,
    this.elevation,
    this.isLeading = true,
  });

  final Widget? leading;
  final Widget? title;
  final String? titleText;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading, isLeading;
  final TextStyle? titleTextStyle;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor:
          backgroundColor ?? context.theme.primaryColorLight.darken(),
      foregroundColor: AppColors.white,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      leading: isLeading
          ? const CloseButton(
              color: AppColors.white,
            )
          : null,
      title: title ??
          (titleText != null && titleText!.isNotEmpty
              ? Text(
                  titleText!,
                  style: titleTextStyle,
                )
              : null),
      actions: actions,
      bottom: bottom,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

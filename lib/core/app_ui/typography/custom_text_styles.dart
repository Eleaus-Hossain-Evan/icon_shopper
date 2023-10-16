import 'package:flutter/material.dart';
import 'package:icon_shopper/core/app_ui/app_ui.dart';

abstract class CustomTextStyles {
  static TextStyle sHeadlineLargeBold =
      ContentTextStyle.headline1.copyWith(fontWeight: AppFontWeight.bold);
  static TextStyle sHeadline1 = ContentTextStyle.headline1;

  static TextStyle sBodyRegular = ContentTextStyle.bodyText1;

  static TextStyle sf30w700 = ContentTextStyle.headline2.copyWith(
    fontWeight: AppFontWeight.bold,
  );
  static var sf16Black900 = ContentTextStyle.subtitle1.copyWith(
    color: AppColors.black900,
  );

  static var s14w = ContentTextStyle.bodyText2.copyWith(
    fontWeight: AppFontWeight.medium,
    letterSpacing: 1,
  );

  static var textStyle14w500Red;

  static var textStyle16w500Black900;

  static var textStyle16w600;

  static var textStyle14w400B800;
}

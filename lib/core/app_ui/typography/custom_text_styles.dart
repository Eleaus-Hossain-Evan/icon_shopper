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
  static var s16Black900 = ContentTextStyle.subtitle1.copyWith(
    color: AppColors.black900,
  );

  static var s14w = ContentTextStyle.bodyText2.copyWith(
    fontWeight: AppFontWeight.medium,
    letterSpacing: 1,
  );

  static var s14w500Red = ContentTextStyle.bodyText2.copyWith(
    fontWeight: AppFontWeight.medium,
    letterSpacing: 1,
    color: AppColors.red,
  );

  static var s16w600Black900 = ContentTextStyle.subtitle1.copyWith(
    fontWeight: AppFontWeight.bold,
    letterSpacing: 1,
    color: AppColors.black900,
  );

  static var s16w600 = ContentTextStyle.subtitle1.copyWith(
    fontWeight: AppFontWeight.bold,
    letterSpacing: 1,
  );

  static var s14w400Black800 = ContentTextStyle.bodyText2.copyWith(
    fontWeight: AppFontWeight.regular,
    letterSpacing: 1,
    color: AppColors.black800,
  );
}

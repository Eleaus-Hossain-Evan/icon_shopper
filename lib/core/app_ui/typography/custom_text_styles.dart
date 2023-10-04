import 'package:flutter/material.dart';
import 'package:icon_shopper/core/app_ui/app_ui.dart';

abstract class CustomTextStyles {
  static TextStyle get sHeadlineLargeBold =>
      ContentTextStyle.headline1.copyWith(fontWeight: AppFontWeight.bold);

  static TextStyle get sBodyRegular => ContentTextStyle.bodyText1;
}

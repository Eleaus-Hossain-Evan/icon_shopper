import 'package:flutter/material.dart';

// --primary-100:#e72327;
// --primary-200:#ff6151;
// --primary-300:#ffcbae;
// --accent-100:#25b1bf;
// --accent-200:#005461;
// --text-100:#1a1a1a;
// --text-200:#404040;
// --bg-100:#ffffff;
// --bg-200:#f5f5f5;
// --bg-300:#cccccc;

/// Defines the color palette for the App UI Kit.
abstract class AppColors {
  static const Color primary = Color(0xffe72327);
  static const Color primary200 = Color(0xffff6151);
  static const Color primary300 = Color(0xffffcbae);
  static const Color secondary = Color(0xFF25b1bf);
  static const Color secondary200 = Color(0xFF005461);
  static const Color tertiary = Color(0xFF3B82F6);

  static const Color text100 = Color(0xFF1a1a1a);
  static const Color text200 = Color(0xFF404040);
  static const Color bg100 = Color(0xFFFFFFFF);
  static const Color bg200 = Color(0xFFf5f5f5);
  static const Color bg300 = Color(0xFFcccccc);

  static const Color disableButton = Color(0xff9a9b9d);

  static const Color info = Color(0xff2F80ED);
  static const Color success = Color(0xff27AE60);
  static const Color warning = Color(0xffE2B93B);
  static const Color error = Color(0xffEB5757);

  static const Color fbColor = Color(0xff0147A5);
  static const Color googleColor = Color(0xffF74134);

  static const Color kKeyUmbraOpacity = Color(0x33000000); // alpha = 0.2
  static const Color kKeyPenumbraOpacity = Color(0x24000000); // alpha = 0.14
  static const Color kAmbientShadowOpacity = Color(0x1F000000); // alpha = 0.12
  /// The secondary color of application.

  /// Black
  static const Color black = Color(0xFF000000);

  static const Color black100 = Color(0xFFF5F5F5);
  static const Color black200 = Color(0xFFEBEBEB);
  static const Color black300 = Color(0xFFD7D7D8);
  static const Color black400 = Color(0xFFC2C3C4);
  static const Color black500 = Color(0xFFAEAFB1);
  static const Color black600 = Color(0xFF9A9B9D);
  static const Color black700 = Color(0xFF7B7C7E);
  static const Color black800 = Color(0xFF5C5D5E);
  static const Color black900 = Color(0xFF3E3E3F);
  static const Color black1000 = Color(0xFF1F1F1F);

  /// Light black
  static const Color lightBlack = Colors.black54;

  /// White
  static const Color white = Color(0xFFFFFFFF);

  /// Transparent
  static const Color transparent = Color(0x00000000);

  /// The grey primary color and swatch.
  static const MaterialColor grey = Colors.grey;

  /// The liver color.
  static const Color liver = Color(0xFF4D4D4D);

  /// The green primary color and swatch.
  static const MaterialColor green = Colors.green;

  /// The teal primary color and swatch.
  static const MaterialColor teal = Colors.teal;

  /// The dark aqua color.
  static const Color darkAqua = Color(0xFF00677F);

  /// The blue primary color and swatch.
  static const Color blue = Color(0xFF3898EC);

  /// The sky blue color.
  static const Color skyBlue = Color(0xFF0175C2);

  /// The ocean blue color.
  static const Color oceanBlue = Color(0xFF02569B);

  /// The light blue color.
  static const MaterialColor lightBlue = Colors.lightBlue;

  /// The blue dress color.
  static const Color blueDress = Color(0xFF1877F2);

  /// The crystal blue color.
  static const Color crystalBlue = Color(0xFF55ACEE);

  /// The light surface2 dress color.
  static const Color surface2 = Color(0xFFEBF2F7);

  /// The pale sky color.
  static const Color paleSky = Color(0xFF73777F);

  /// The input hover color.
  static const Color inputHover = Color(0xFFE4E4E4);

  /// The input focused color.
  static const Color inputFocused = Color(0xFFD1D1D1);

  /// The input enabled color.
  static const Color inputEnabled = Color(0xFFEDEDED);

  /// The pastel grey color.
  static const Color pastelGrey = Color(0xFFCCCCCC);

  /// The bright grey color.
  static const Color brightGrey = Color(0xFFEAEAEA);

  /// The yellow primary color.
  static const MaterialColor yellow = Colors.yellow;

  /// The red primary color and swatch.
  static const MaterialColor red = Colors.red;

  /// The background color.
  static const Color background = Color(0xFFFFFFFF);

  /// The dark background color.
  static const Color darkBackground = Color(0xFF001F28);

  /// The on-background color.
  static const Color onBackground = Color(0xFF1A1A1A);

  /// The primary container color.
  static const Color primaryContainer = Color(0xFFB1EBFF);

  /// The dark text 1 color.
  static const Color darkText1 = Color(0xFFFCFCFC);

  /// The red wine color.
  static const Color redWine = Color(0xFF9A031E);

  /// The rangoonGreen color.
  static const Color rangoonGreen = Color(0xFF1B1B1B);

  /// The modal background color.
  static const Color modalBackground = Color(0xFFEBF2F7);

  /// The eerie black color.
  static const Color eerieBlack = Color(0xFF191C1D);

  /// The medium emphasis primary color.
  static const Color mediumEmphasisPrimary = Color(0xBDFFFFFF);

  /// The medium emphasis surface color.
  static const Color mediumEmphasisSurface = Color(0x99000000);

  /// The high emphasis primary color.
  static const Color highEmphasisPrimary = Color(0xFCFFFFFF);

  /// The high emphasis surface color.
  static const Color highEmphasisSurface = Color(0xE6000000);

  /// The border outline color.
  static const Color borderOutline = Color(0x33000000);

  /// The light outline color.
  static const Color outlineLight = Color(0x33000000);

  /// The outline on dark color.
  static const Color outlineOnDark = Color(0x29FFFFFF);

  /// The medium high emphasis primary color.
  static const Color mediumHighEmphasisPrimary = Color(0xE6FFFFFF);

  /// The medium high emphasis surface color.
  static const Color mediumHighEmphasisSurface = Color(0xB3000000);

  /// The default disabled foreground color.
  static const Color disabledForeground = Color(0x611B1B1B);

  /// The default disabled button color.
  static const Color disabledButton = Color(0x1F000000);

  /// The default disabled surface color.
  static const Color disabledSurface = Color(0xFFE0E0E0);

  /// The gainsboro color.
  static const Color gainsboro = Color(0xFFDADCE0);

  /// The orange color.
  static const Color orange = Color(0xFFFB8B24);
}

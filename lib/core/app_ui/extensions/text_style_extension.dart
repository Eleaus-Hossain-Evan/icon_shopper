part of 'extensions.dart';

extension TextStyleHelpers on TextStyle {
  /// FontWeight value of `w900`
  TextStyle get black => copyWith(fontWeight: AppFontWeight.thin);

  /// FontWeight value of `w800`
  TextStyle get extraBold => copyWith(fontWeight: AppFontWeight.thin);

  /// FontWeight value of `w700`
  TextStyle get bold => copyWith(fontWeight: AppFontWeight.thin);

  /// FontWeight value of `w600`
  TextStyle get semiBold => copyWith(fontWeight: AppFontWeight.thin);

  /// FontWeight value of `w500`
  TextStyle get medium => copyWith(fontWeight: AppFontWeight.thin);

  /// FontWeight value of `w400`
  TextStyle get regular => copyWith(fontWeight: AppFontWeight.thin);

  /// FontWeight value of `w300`
  TextStyle get light => copyWith(fontWeight: AppFontWeight.thin);

  /// FontWeight value of `w200`
  TextStyle get extraLight => copyWith(fontWeight: AppFontWeight.thin);

  /// FontWeight value of `w100`
  TextStyle get thin => copyWith(fontWeight: AppFontWeight.thin);

  /// FontStyle value of `italic`
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle letterSpace(double value) => copyWith(letterSpacing: value);

  TextStyle font(double value) => copyWith(fontSize: value);
  TextStyle color(Color value) => copyWith(color: value);
  TextStyle colorPrimary() => copyWith(color: AppColors.primary);
  TextStyle colorSecondary() => copyWith(color: AppColors.secondary);
  TextStyle colorTertiary() => copyWith(color: AppColors.tertiary);
}

extension TextThemeStylesX on BuildContext {
  // ColorScheme get color => Theme.of(this).colorScheme;
  ThemeData get themeData => Theme.of(this);

  // CustomTextStyle get style => CustomTextStyle.instance;

  // TextStyle get bodyText1 =>
  //     Theme.of(this).textTheme.bodyLarge!.copyWith(color: ColorPalate.black);

  // TextStyle get bodyText2 =>
  //     Theme.of(this).textTheme.bodyMedium!.copyWith(color: ColorPalate.black);

  // TextStyle get subtitle1 =>
  //     Theme.of(this).textTheme.titleMedium!.copyWith(color: ColorPalate.black);

  // TextStyle get subtitle2 =>
  //     Theme.of(this).textTheme.titleSmall!.copyWith(color: ColorPalate.black);

  // TextStyle get headline1 =>
  //     Theme.of(this).textTheme.displayLarge!.copyWith(color: ColorPalate.black);

  // TextStyle get headline2 => Theme.of(this)
  //     .textTheme
  //     .displayMedium!
  //     .copyWith(color: ColorPalate.black);

  // TextStyle get headline3 =>
  //     Theme.of(this).textTheme.displaySmall!.copyWith(color: ColorPalate.black);

  // TextStyle get headline4 => Theme.of(this)
  //     .textTheme
  //     .headlineMedium!
  //     .copyWith(color: ColorPalate.black);

  // TextStyle get headline5 => Theme.of(this)
  //     .textTheme
  //     .headlineSmall!
  //     .copyWith(color: ColorPalate.black);

  // TextStyle get headline6 =>
  //     Theme.of(this).textTheme.titleLarge!.copyWith(color: ColorPalate.black);

  // TextStyle get headlineLarge => Theme.of(this)
  //     .textTheme
  //     .headlineLarge!
  //     .copyWith(color: ColorPalate.black);
  // TextStyle get headlineMedium => Theme.of(this)
  //     .textTheme
  //     .headlineMedium!
  //     .copyWith(color: ColorPalate.black);
  // TextStyle get headlineSmall => Theme.of(this)
  //     .textTheme
  //     .headlineSmall!
  //     .copyWith(color: ColorPalate.black);
  // TextStyle get bodyLarge =>
  //     Theme.of(this).textTheme.bodyLarge!.copyWith(color: ColorPalate.black);
  // TextStyle get bodyMedium =>
  //     Theme.of(this).textTheme.bodyMedium!.copyWith(color: ColorPalate.black);
  // TextStyle get bodySmall =>
  //     Theme.of(this).textTheme.bodySmall!.copyWith(color: ColorPalate.black);
  // TextStyle get caption => Theme.of(this).textTheme.bodySmall!.copyWith();
  // TextStyle get displayLarge =>
  //     Theme.of(this).textTheme.displayLarge!.copyWith(color: ColorPalate.black);
  // TextStyle get displayMedium => Theme.of(this)
  //     .textTheme
  //     .displayMedium!
  //     .copyWith(color: ColorPalate.black);
  // TextStyle get displaySmall =>
  //     Theme.of(this).textTheme.displaySmall!.copyWith(color: ColorPalate.black);
  // TextStyle get labelLarge =>
  //     Theme.of(this).textTheme.labelLarge!.copyWith(color: ColorPalate.black);
  // TextStyle get labelLMedium =>
  //     Theme.of(this).textTheme.labelMedium!.copyWith(color: ColorPalate.black);
  // TextStyle get labelLSmall =>
  //     Theme.of(this).textTheme.labelSmall!.copyWith(color: ColorPalate.black);
  // TextStyle get titleLarge =>
  //     Theme.of(this).textTheme.titleLarge!.copyWith(color: ColorPalate.black);
  // TextStyle get titleMedium =>
  //     Theme.of(this).textTheme.titleMedium!.copyWith(color: ColorPalate.black);
  // TextStyle get titleSmall =>
  //     Theme.of(this).textTheme.titleSmall!.copyWith(color: ColorPalate.black);
}

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core.dart';

abstract class AppTheme {
  // This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
  static final lightTheme = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.tertiary,
      error: AppColors.orange,
    ),
    surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
    scaffoldBackground: AppColors.bg100,
    appBarBackground: AppColors.bg100,
    surface: AppColors.bg100,
    blendLevel: 9,
    subThemesData: FlexSubThemesData(
      useTextTheme: true,
      bottomSheetRadius: 20.r,
      defaultRadius: 8.r,
      adaptiveRadius: const FlexAdaptive.all(),
      defaultRadiusAdaptive: 8.r,
      bottomSheetModalBackgroundColor: SchemeColor.surface,
      bottomSheetBackgroundColor: SchemeColor.surface,
      dialogBackgroundSchemeColor: SchemeColor.background,
      buttonMinSize: const Size.fromHeight(kToolbarHeight),
      outlinedButtonRadius: 8.r,
      // outlinedButtonTextStyle: MaterialStateProperty.all(
      //   TextStyle(
      //     fontSize: 18.sp,
      //     fontWeight: FontWeight.w600,
      //     letterSpacing: .15,
      //     color: AppColors.bg300,
      //   ),
      // ),
      outlinedButtonBorderWidth: 1.w,
      filledButtonRadius: 8.r,
      // filledButtonTextStyle: MaterialStateProperty.all(TextStyle(
      //   fontSize: 18.sp,
      //   fontWeight: FontWeight.w600,
      //   letterSpacing: .15,
      //   color: AppColors.bg300,
      // )),
      filledButtonSchemeColor: SchemeColor.inverseSurface,
      elevatedButtonRadius: 8.r,
      // elevatedButtonTextStyle: MaterialStateProperty.all(
      //   TextStyle(
      //     fontSize: 18.sp,
      //     fontWeight: FontWeight.w600,
      //     letterSpacing: .15,
      //     color: AppColors.bg300,
      //   ),
      // ),
      elevatedButtonSchemeColor: SchemeColor.secondary,
      outlinedButtonOutlineSchemeColor: SchemeColor.secondary,
      outlinedButtonSchemeColor: SchemeColor.secondary,
      adaptiveSplash: const FlexAdaptive.all(),
      splashType: FlexSplashType.inkSparkle,
      splashTypeAdaptive: FlexSplashType.inkSparkle,
      // datePickerDialogRadius: 0,
      // datePickerHeaderBackgroundSchemeColor: SchemeColor.background,
      // useFlutterDefaults: true,
    ),
    useMaterial3: true,
    useMaterial3ErrorColors: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    swapLegacyOnMaterial3: true,
    // To use the playground font, add GoogleFonts package and uncomment
    fontFamily: GoogleFonts.jost().fontFamily,
  );
  static final darkTheme = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
    ),
    surfaceMode: FlexSurfaceMode.highSurfaceLowScaffold,
    scaffoldBackground: AppColors.black900,
    appBarBackground: AppColors.black900,
    surface: AppColors.black900,
    blendLevel: 9,
    subThemesData: const FlexSubThemesData(useTextTheme: true),
    useMaterial3: true,
    useMaterial3ErrorColors: true,
    // visualDensity: FlexColorScheme.comfortablePlatformDensity,
    // To use the playground font, add GoogleFonts package and uncomment
    fontFamily: GoogleFonts.jost().fontFamily,
  );
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
}

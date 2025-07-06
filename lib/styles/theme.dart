import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/core/typography.dart';
import 'package:flutter_conf_latam/styles/schemes/color_scheme.dart';
import 'package:flutter_conf_latam/styles/schemes/theme_scheme.dart';
import 'package:flutter_conf_latam/styles/schemes/typography_scheme.dart';

class FclTheme {
  static ThemeData light() {
    return ThemeData.light().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: FlutterLatamColors.white,
      dividerColor: FlutterLatamColors.white,
      extensions: <ThemeExtension<FclThemeScheme>>[
        FclThemeScheme(
          colorScheme: FclColorScheme(
            background: FlutterLatamColors.mainBlue,
            primary: FlutterLatamColors.darkBlue,
            secondary: FlutterLatamColors.yellow,
            tertiary: FlutterLatamColors.green,
            neutral: FlutterLatamColors.white,
            inverseNeutral: FlutterLatamColors.black,
            accentPrimary: FlutterLatamColors.mediumBlue,
            accentSecondary: FlutterLatamColors.lightYellow,
            accentTertiary: FlutterLatamColors.lightGreen,
            primaryFixed: FlutterLatamColors.mediumBlue,
            tertiaryFixed: FlutterLatamColors.lightRed,
            error: FlutterLatamColors.red,
            accentError: FlutterLatamColors.mediumRed,
            surface: FlutterLatamColors.purple,
            accentSurface: FlutterLatamColors.pink,
            outline: FlutterLatamColors.silver,
            accentOutline: FlutterLatamColors.grey,
          ),
          typography: FclTypographyScheme(
            h1Bold: FlutterLatamTypography.h1.copyWith(
              fontWeight: FontWeight.bold,
              color: FlutterLatamColors.white,
            ),
            h2Bold: FlutterLatamTypography.h2.copyWith(
              fontWeight: FontWeight.bold,
              color: FlutterLatamColors.white,
            ),
            h3Bold: FlutterLatamTypography.h3.copyWith(
              fontWeight: FontWeight.bold,
              color: FlutterLatamColors.white,
            ),
            h4Bold: FlutterLatamTypography.h4.copyWith(
              fontWeight: FontWeight.bold,
              color: FlutterLatamColors.white,
            ),
            subH1Regular: FlutterLatamTypography.subH1.copyWith(
              fontWeight: FontWeight.w400,
              color: FlutterLatamColors.white,
            ),
            subH2Semibold: FlutterLatamTypography.subH2.copyWith(
              fontWeight: FontWeight.w600,
              color: FlutterLatamColors.white,
            ),
            subH3Regular: FlutterLatamTypography.subH3.copyWith(
              fontWeight: FontWeight.w400,
              color: FlutterLatamColors.white,
            ),
            buttonNormalMedium: FlutterLatamTypography.buttonNormal.copyWith(
              fontWeight: FontWeight.w500,
              color: FlutterLatamColors.white,
            ),
            buttonSmallMedium: FlutterLatamTypography.buttonSmall.copyWith(
              fontWeight: FontWeight.w500,
              color: FlutterLatamColors.white,
            ),
            body1Regular: FlutterLatamTypography.body1.copyWith(
              fontWeight: FontWeight.w400,
              color: FlutterLatamColors.white,
            ),
            body2Regular: FlutterLatamTypography.body2.copyWith(
              fontWeight: FontWeight.w400,
              color: FlutterLatamColors.white,
            ),
            body3Regular: FlutterLatamTypography.body3.copyWith(
              fontWeight: FontWeight.w400,
              color: FlutterLatamColors.white,
            ),
            body4Regular: FlutterLatamTypography.body4.copyWith(
              fontWeight: FontWeight.w400,
              color: FlutterLatamColors.white,
            ),
            captionRegular: FlutterLatamTypography.caption.copyWith(
              fontWeight: FontWeight.w400,
              color: FlutterLatamColors.white,
            ),
          ),
        ),
      ],
    );
  }
}

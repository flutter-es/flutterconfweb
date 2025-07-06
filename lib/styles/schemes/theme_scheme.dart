import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/styles/schemes/color_scheme.dart';
import 'package:flutter_conf_latam/styles/schemes/typography_scheme.dart';

class FclThemeScheme extends ThemeExtension<FclThemeScheme> {
  FclThemeScheme({required this.colorScheme, required this.typography});

  final FclColorScheme colorScheme;
  final FclTypographyScheme typography;

  @override
  ThemeExtension<FclThemeScheme> copyWith({
    FclColorScheme? colorScheme,
    FclTypographyScheme? typography,
  }) {
    return FclThemeScheme(
      colorScheme: colorScheme ?? this.colorScheme,
      typography: typography ?? this.typography,
    );
  }

  @override
  ThemeExtension<FclThemeScheme> lerp(
    covariant ThemeExtension<FclThemeScheme>? other,
    double t,
  ) {
    if (other is! FclThemeScheme) return this;

    return FclThemeScheme(colorScheme: colorScheme, typography: typography);
  }
}

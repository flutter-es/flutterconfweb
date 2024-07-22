import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ErrorPageResponsiveConfig {
  ErrorPageResponsiveConfig({
    required this.titleSize,
    required this.subtitleSize,
    required this.dashDimensions,
    required this.textContainerWidth,
  });

  final double titleSize;
  final double subtitleSize;
  final double dashDimensions;
  final double textContainerWidth;

  static ErrorPageResponsiveConfig getSponsorsBannerConfig(BuildContext ctxt) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: ErrorPageResponsiveConfig(
        titleSize: 40,
        subtitleSize: 20,
        dashDimensions: 250,
        textContainerWidth: 250,
      ),
      tablet: ErrorPageResponsiveConfig(
        titleSize: 50,
        subtitleSize: 20,
        dashDimensions: 300,
        textContainerWidth: 300,
      ),
      desktop: ErrorPageResponsiveConfig(
        titleSize: 60,
        subtitleSize: 30,
        dashDimensions: 400,
        textContainerWidth: 400,
      ),
    );

    return config;
  }
}

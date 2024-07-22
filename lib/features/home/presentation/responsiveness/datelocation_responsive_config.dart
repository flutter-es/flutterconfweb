import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DateLocationResponsiveConfig {
  DateLocationResponsiveConfig({
    required this.dateSize,
    required this.addressSize,
    required this.locationSize,
    required this.padding,
  });

  final double dateSize;
  final double locationSize;
  final double addressSize;
  final double padding;

  static DateLocationResponsiveConfig getDateLocationBannerConfig(
    BuildContext ctxt,
  ) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: DateLocationResponsiveConfig(
        dateSize: 30,
        locationSize: 50,
        addressSize: 15,
        padding: 10,
      ),
      tablet: DateLocationResponsiveConfig(
        dateSize: 50,
        locationSize: 70,
        addressSize: 15,
        padding: 30,
      ),
      desktop: DateLocationResponsiveConfig(
        dateSize: 60,
        locationSize: 80,
        addressSize: 20,
        padding: 40,
      ),
    );

    return config;
  }
}

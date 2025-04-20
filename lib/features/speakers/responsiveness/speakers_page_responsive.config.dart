import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SpeakersPageResponsiveConfig {
  const SpeakersPageResponsiveConfig({
    required this.pagePadding,
    required this.headerStyle,
    required this.subheaderStyle,
    required this.headerDirection,
    required this.headerGap,
    required this.headerIconSize,
    required this.pageVerticalGap,
    required this.textAlignment,
  });

  final EdgeInsets pagePadding;
  final TextStyle headerStyle;
  final TextStyle subheaderStyle;
  final TextAlign textAlignment;
  final Axis headerDirection;
  final double headerIconSize;
  final SizedBox headerGap;
  final SizedBox pageVerticalGap;

  static SpeakersPageResponsiveConfig getSpeakersPageResponsiveConfig(
    BuildContext ctxt,
  ) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: const SpeakersPageResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.largePadding,
        headerGap: FlutterConfLatamStyles.smallVGap,
        headerStyle: FlutterConfLatamStyles.h3,
        subheaderStyle: FlutterConfLatamStyles.h6,
        headerDirection: Axis.vertical,
        headerIconSize: 60,
        textAlignment: TextAlign.center,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
      ),
      tablet: const SpeakersPageResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.mediumPadding,
        headerStyle: FlutterConfLatamStyles.h2,
        subheaderStyle: FlutterConfLatamStyles.h5,
        headerGap: FlutterConfLatamStyles.smallHGap,
        headerDirection: Axis.horizontal,
        headerIconSize: 60,
        textAlignment: TextAlign.center,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
      ),
      desktop: const SpeakersPageResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.xLargePadding,
        headerStyle: FlutterConfLatamStyles.h1,
        subheaderStyle: FlutterConfLatamStyles.h4,
        headerGap: FlutterConfLatamStyles.smallHGap,
        headerDirection: Axis.horizontal,
        headerIconSize: 80,
        textAlignment: TextAlign.center,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
      ),
    );

    return config;
  }
}

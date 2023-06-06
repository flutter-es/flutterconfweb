import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SchedulePageResponsiveConfig {
  const SchedulePageResponsiveConfig({
    required this.pagePadding,
    required this.headerStyle,
    required this.subheaderStyle,
    required this.headerDirection,
    required this.headerGap,
    required this.headerIconSize,
    required this.pageVerticalGap,
});


  final EdgeInsets pagePadding;
  final TextStyle headerStyle;
  final TextStyle subheaderStyle;
  final Axis headerDirection;
  final double headerIconSize;
  final SizedBox headerGap;
  final SizedBox pageVerticalGap;


  static SchedulePageResponsiveConfig getSchedulePageResponsiveConfig(BuildContext ctxt) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: const SchedulePageResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.largePadding,
        headerGap: FlutterConfLatamStyles.smallVGap,
        headerStyle: FlutterConfLatamStyles.h2,
        subheaderStyle: FlutterConfLatamStyles.h6,
        headerDirection: Axis.vertical,
        headerIconSize: 60,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
      ),
      tablet: const SchedulePageResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.mediumPadding,
        headerStyle: FlutterConfLatamStyles.h2,
        subheaderStyle: FlutterConfLatamStyles.h5,
        headerGap: FlutterConfLatamStyles.smallHGap,
        headerDirection: Axis.horizontal,
        headerIconSize: 60,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
      ),
      desktop: const SchedulePageResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.xLargePadding,
        headerStyle: FlutterConfLatamStyles.h1,
        subheaderStyle: FlutterConfLatamStyles.h4,
        headerGap: FlutterConfLatamStyles.smallHGap,
        headerDirection: Axis.horizontal,
        headerIconSize: 80,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
      ),
    );

    return config;
  }
}

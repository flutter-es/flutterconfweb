import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScheduleContentResponsiveConfig {
  const ScheduleContentResponsiveConfig({
    required this.pagePadding,
    required this.trackTabPadding,
    required this.headerStyle,
    required this.subheaderStyle,
    required this.headerDirection,
    required this.headerGap,
    required this.headerIconSize,
    required this.pageVerticalGap,
    required this.tabDayLabelStyle,
    required this.trackLabelStyle,
    required this.timeContentOrientation,
    required this.tabDateLabelStyle,
    required this.timeFlexValue,
    required this.contentFlexValue,
    required this.contentBottomRowOrientation,
    required this.contentBottomLeftFlex,
});


  final EdgeInsets pagePadding;
  final EdgeInsets trackTabPadding;
  final TextStyle headerStyle;
  final TextStyle subheaderStyle;
  final Axis headerDirection;
  final double headerIconSize;
  final SizedBox headerGap;
  final SizedBox pageVerticalGap;

  final TextStyle tabDayLabelStyle;
  final TextStyle tabDateLabelStyle;
  final Axis timeContentOrientation;
  final int timeFlexValue;
  final int contentFlexValue;
  final Axis contentBottomRowOrientation;
  final int contentBottomLeftFlex;
  final TextStyle trackLabelStyle;



  static ScheduleContentResponsiveConfig getSchedulePageResponsiveConfig(BuildContext ctxt) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: const ScheduleContentResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.largePadding,
        headerGap: FlutterConfLatamStyles.xsmallVGap,
        headerStyle: FlutterConfLatamStyles.h5,
        subheaderStyle: FlutterConfLatamStyles.h7,
        headerDirection: Axis.vertical,
        headerIconSize: 40,
        pageVerticalGap: FlutterConfLatamStyles.xsmallVGap,
        tabDayLabelStyle: FlutterConfLatamStyles.h6,
        tabDateLabelStyle: FlutterConfLatamStyles.h7,
        timeContentOrientation: Axis.vertical,
        timeFlexValue: 0,
        contentFlexValue: 0,
        contentBottomRowOrientation: Axis.vertical,
        contentBottomLeftFlex: 0,
        trackLabelStyle: FlutterConfLatamStyles.h7,
        trackTabPadding: FlutterConfLatamStyles.smallPadding,
      ),
      tablet: const ScheduleContentResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.mediumPadding,
        headerStyle: FlutterConfLatamStyles.h2,
        subheaderStyle: FlutterConfLatamStyles.h5,
        headerGap: FlutterConfLatamStyles.smallHGap,
        headerDirection: Axis.horizontal,
        headerIconSize: 60,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
        tabDayLabelStyle: FlutterConfLatamStyles.h6,
        tabDateLabelStyle: FlutterConfLatamStyles.h7,
        timeContentOrientation: Axis.horizontal,
        timeFlexValue: 1,
        contentFlexValue: 4,
        contentBottomRowOrientation: Axis.horizontal,
        contentBottomLeftFlex: 1,
        trackLabelStyle: FlutterConfLatamStyles.h7,
        trackTabPadding: FlutterConfLatamStyles.mediumPadding,
      ),
      desktop: const ScheduleContentResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.xLargePadding,
        headerStyle: FlutterConfLatamStyles.h1,
        subheaderStyle: FlutterConfLatamStyles.h4,
        headerGap: FlutterConfLatamStyles.smallHGap,
        headerDirection: Axis.horizontal,
        headerIconSize: 80,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
        tabDayLabelStyle: FlutterConfLatamStyles.h5,
        tabDateLabelStyle: FlutterConfLatamStyles.h7,
        timeContentOrientation: Axis.horizontal,
        timeFlexValue: 1,
        contentFlexValue: 4,
        contentBottomRowOrientation: Axis.horizontal,
        contentBottomLeftFlex: 1,
        trackLabelStyle: FlutterConfLatamStyles.h6,
        trackTabPadding: FlutterConfLatamStyles.mediumPadding,
      ),
    );

    return config;
  }
}

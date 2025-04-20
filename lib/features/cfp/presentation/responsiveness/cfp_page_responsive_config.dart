import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CfpPageResponsiveConfig {
  const CfpPageResponsiveConfig({
    required this.pagePadding,
    required this.headerStyle,
    required this.deadlineHeaderStyle,
    required this.subheaderStyle,
    required this.headerDirection,
    required this.headerGap,
    required this.headerIconSize,
    required this.pageVerticalGap,
    required this.cfpButtonIconSize,
    required this.cfpButtonLabelSize,
    required this.cfpButtonIconPadding,
    required this.ticketButtonMargin,
  });

  final EdgeInsets pagePadding;
  final TextStyle headerStyle;
  final TextStyle deadlineHeaderStyle;
  final TextStyle subheaderStyle;
  final Axis headerDirection;
  final double headerIconSize;
  final SizedBox headerGap;
  final SizedBox pageVerticalGap;
  final double cfpButtonIconSize;
  final double cfpButtonLabelSize;
  final double cfpButtonIconPadding;
  final double ticketButtonMargin;

  static CfpPageResponsiveConfig getCfpPageResponsiveConfig(BuildContext ctxt) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: const CfpPageResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.largePadding,
        headerGap: FlutterConfLatamStyles.smallVGap,
        headerStyle: FlutterConfLatamStyles.h2,
        deadlineHeaderStyle: FlutterConfLatamStyles.h6,
        subheaderStyle: FlutterConfLatamStyles.h4,
        headerDirection: Axis.vertical,
        headerIconSize: 60,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
        cfpButtonIconSize: 20,
        cfpButtonLabelSize: 20,
        cfpButtonIconPadding: 15,
        ticketButtonMargin: 15,
      ),
      tablet: const CfpPageResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.mediumPadding,
        headerStyle: FlutterConfLatamStyles.h2,
        subheaderStyle: FlutterConfLatamStyles.h3,
        deadlineHeaderStyle: FlutterConfLatamStyles.h5,
        headerGap: FlutterConfLatamStyles.smallHGap,
        headerDirection: Axis.horizontal,
        headerIconSize: 60,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
        cfpButtonIconSize: 30,
        cfpButtonLabelSize: 20,
        cfpButtonIconPadding: 20,
        ticketButtonMargin: 20,
      ),
      desktop: const CfpPageResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.xLargePadding,
        headerStyle: FlutterConfLatamStyles.h1,
        subheaderStyle: FlutterConfLatamStyles.h3,
        deadlineHeaderStyle: FlutterConfLatamStyles.h5,
        headerGap: FlutterConfLatamStyles.smallHGap,
        headerDirection: Axis.horizontal,
        headerIconSize: 80,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
        cfpButtonIconSize: 30,
        cfpButtonLabelSize: 20,
        cfpButtonIconPadding: 20,
        ticketButtonMargin: 20,
      ),
    );

    return config;
  }
}

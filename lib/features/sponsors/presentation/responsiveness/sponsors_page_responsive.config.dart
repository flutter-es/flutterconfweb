import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SponsorsPageResponsiveConfig {
  const SponsorsPageResponsiveConfig({
    required this.pagePadding,
    required this.headerStyle,
    required this.subheaderStyle,
    required this.headerDirection,
    required this.headerGap,
    required this.headerIconSize,
    required this.pageVerticalGap,
    required this.ticketButtonIconSize, 
    required this.ticketButtonLabelSize, 
    required this.ticketButtonIconPadding, 
    required this.ticketButtonMargin, 
    required this.ticketButtonAlignment, 
    required this.ticketButtonColumnCrossAxis, 
    required this.ticketButtonColumnMainAxis,
});


  final EdgeInsets pagePadding;
  final TextStyle headerStyle;
  final TextStyle subheaderStyle;
  final Axis headerDirection;
  final double headerIconSize;
  final SizedBox headerGap;
  final SizedBox pageVerticalGap;
  final double ticketButtonIconSize;
  final double ticketButtonLabelSize;
  final double ticketButtonIconPadding;
  final double ticketButtonMargin;
  final Alignment ticketButtonAlignment;
  final CrossAxisAlignment ticketButtonColumnCrossAxis;
  final MainAxisAlignment ticketButtonColumnMainAxis;


  static SponsorsPageResponsiveConfig getSponsorsPageResponsiveConfig(BuildContext ctxt) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: const SponsorsPageResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.largePadding,
        headerGap: FlutterConfLatamStyles.smallVGap,
        headerStyle: FlutterConfLatamStyles.h4,
        subheaderStyle: FlutterConfLatamStyles.h6,
        headerDirection: Axis.vertical,
        headerIconSize: 60,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
        ticketButtonIconSize: 20.0,
        ticketButtonLabelSize: 15.0,
        ticketButtonIconPadding: 10.0,
        ticketButtonMargin: 0.0,
        ticketButtonAlignment: Alignment.center,
        ticketButtonColumnCrossAxis: CrossAxisAlignment.center,
        ticketButtonColumnMainAxis: MainAxisAlignment.center,
      ),
      tablet: const SponsorsPageResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.mediumPadding,
        headerStyle: FlutterConfLatamStyles.h2,
        subheaderStyle: FlutterConfLatamStyles.h5,
        headerGap: FlutterConfLatamStyles.smallHGap,
        headerDirection: Axis.horizontal,
        headerIconSize: 60,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
        ticketButtonIconSize: 20.0,
        ticketButtonLabelSize: 30.0,
        ticketButtonIconPadding: 20.0,
        ticketButtonMargin: 30.0,
        ticketButtonAlignment: Alignment.bottomRight,
        ticketButtonColumnCrossAxis: CrossAxisAlignment.end,
        ticketButtonColumnMainAxis: MainAxisAlignment.end,
      ),
      desktop: const SponsorsPageResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.xLargePadding,
        headerStyle: FlutterConfLatamStyles.h1,
        subheaderStyle: FlutterConfLatamStyles.h4,
        headerGap: FlutterConfLatamStyles.smallHGap,
        headerDirection: Axis.horizontal,
        headerIconSize: 80,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
        ticketButtonIconSize: 20.0,
        ticketButtonLabelSize: 30.0,
        ticketButtonIconPadding: 20.0,
        ticketButtonMargin: 40.0,
        ticketButtonAlignment: Alignment.bottomRight,
        ticketButtonColumnCrossAxis: CrossAxisAlignment.end,
        ticketButtonColumnMainAxis: MainAxisAlignment.end,
      ),
    );

    return config;
  }
}

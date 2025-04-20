import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TicketPageResponsiveConfig {
  const TicketPageResponsiveConfig({
    required this.pagePadding,
    required this.headerStyle,
    required this.subheaderStyle,
    required this.paragraphHeaderStyle,
    required this.headerDirection,
    required this.headerGap,
    required this.headerIconSize,
    required this.pageVerticalGap,
    required this.ticketButtonIconSize,
    required this.ticketButtonLabelSize,
    required this.ticketButtonIconPadding,
    required this.ticketButtonMargin,
  });

  final EdgeInsets pagePadding;
  final TextStyle headerStyle;
  final TextStyle subheaderStyle;
  final TextStyle paragraphHeaderStyle;
  final Axis headerDirection;
  final double headerIconSize;
  final SizedBox headerGap;
  final SizedBox pageVerticalGap;
  final double ticketButtonIconSize;
  final double ticketButtonLabelSize;
  final double ticketButtonIconPadding;
  final double ticketButtonMargin;

  static TicketPageResponsiveConfig getTicketPageResponsiveConfig(
    BuildContext ctxt,
  ) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: const TicketPageResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.largePadding,
        headerGap: FlutterConfLatamStyles.smallVGap,
        headerStyle: FlutterConfLatamStyles.h3,
        subheaderStyle: FlutterConfLatamStyles.h6,
        paragraphHeaderStyle: FlutterConfLatamStyles.h7,
        headerDirection: Axis.vertical,
        headerIconSize: 60,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
        ticketButtonIconSize: 20,
        ticketButtonLabelSize: 20,
        ticketButtonIconPadding: 15,
        ticketButtonMargin: 15,
      ),
      tablet: const TicketPageResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.mediumPadding,
        headerStyle: FlutterConfLatamStyles.h2,
        subheaderStyle: FlutterConfLatamStyles.h5,
        paragraphHeaderStyle: FlutterConfLatamStyles.h6,
        headerGap: FlutterConfLatamStyles.smallHGap,
        headerDirection: Axis.horizontal,
        headerIconSize: 60,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
        ticketButtonIconSize: 30,
        ticketButtonLabelSize: 20,
        ticketButtonIconPadding: 20,
        ticketButtonMargin: 20,
      ),
      desktop: const TicketPageResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.xLargePadding,
        headerStyle: FlutterConfLatamStyles.h1,
        subheaderStyle: FlutterConfLatamStyles.h4,
        paragraphHeaderStyle: FlutterConfLatamStyles.h5,
        headerGap: FlutterConfLatamStyles.smallHGap,
        headerDirection: Axis.horizontal,
        headerIconSize: 80,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
        ticketButtonIconSize: 30,
        ticketButtonLabelSize: 20,
        ticketButtonIconPadding: 20,
        ticketButtonMargin: 20,
      ),
    );

    return config;
  }
}

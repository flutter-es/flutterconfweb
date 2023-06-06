import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContactPageResponsiveConfig {
  const ContactPageResponsiveConfig({
    required this.pagePadding,
    required this.headerStyle,
    required this.subheaderStyle,
    required this.headerDirection,
    required this.headerGap,
    required this.headerIconSize,
    required this.pageVerticalGap,
    required this.contactInfoDirection,
    required this.contactInfoIconSize,
    required this.contactInfoStyle,
    required this.contactInfoPadding,
    required this.contactInfoMargin,
    required this.contactInfoAlignment,
});


  final EdgeInsets pagePadding;
  final TextStyle headerStyle;
  final TextStyle subheaderStyle;
  final TextStyle contactInfoStyle;
  final Axis headerDirection;
  final double headerIconSize;
  final SizedBox headerGap;
  final SizedBox pageVerticalGap;
  final double contactInfoIconSize;
  final Axis contactInfoDirection;
  final EdgeInsets contactInfoPadding;
  final EdgeInsets contactInfoMargin;
  final CrossAxisAlignment contactInfoAlignment;


  static ContactPageResponsiveConfig getContactPageResponsiveConfig(BuildContext ctxt) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: const ContactPageResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.largePadding,
        headerGap: FlutterConfLatamStyles.smallVGap,
        headerStyle: FlutterConfLatamStyles.h2,
        contactInfoStyle: FlutterConfLatamStyles.h7,
        subheaderStyle: FlutterConfLatamStyles.h5,
        headerDirection: Axis.vertical,
        headerIconSize: 60,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
        contactInfoIconSize: 40,
        contactInfoDirection: Axis.vertical,
        contactInfoPadding: FlutterConfLatamStyles.smallPadding,
        contactInfoMargin: FlutterConfLatamStyles.smallMargin,
        contactInfoAlignment: CrossAxisAlignment.center,
      ),
      tablet: const ContactPageResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.mediumPadding,
        headerStyle: FlutterConfLatamStyles.h2,
        subheaderStyle: FlutterConfLatamStyles.h5,
        headerGap: FlutterConfLatamStyles.smallHGap,
        headerDirection: Axis.horizontal,
        headerIconSize: 60,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
        contactInfoStyle: FlutterConfLatamStyles.h6,
        contactInfoDirection: Axis.horizontal,
        contactInfoIconSize: 80,
        contactInfoPadding: FlutterConfLatamStyles.mediumPadding,
        contactInfoMargin: FlutterConfLatamStyles.mediumMargin,
        contactInfoAlignment: CrossAxisAlignment.start,
      ),
      desktop: const ContactPageResponsiveConfig(
        pagePadding: FlutterConfLatamStyles.xLargePadding,
        headerStyle: FlutterConfLatamStyles.h1,
        subheaderStyle: FlutterConfLatamStyles.h4,
        headerGap: FlutterConfLatamStyles.smallHGap,
        headerDirection: Axis.horizontal,
        headerIconSize: 80,
        pageVerticalGap: FlutterConfLatamStyles.mediumVGap,
        contactInfoIconSize: 100,
        contactInfoStyle: FlutterConfLatamStyles.h5,
        contactInfoDirection: Axis.horizontal,
        contactInfoPadding: FlutterConfLatamStyles.mediumPadding,
        contactInfoMargin: FlutterConfLatamStyles.mediumMargin,
        contactInfoAlignment: CrossAxisAlignment.start,
      ),
    );

    return config;
  }
}

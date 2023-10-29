import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FarewellPageResponsiveConfig {
  const FarewellPageResponsiveConfig({
    required this.bannerHeight,
    required this.bannerMargin,
    required this.dashAlignment, 
    required this.dashSize, 
    required this.dashBottomOffset, 
    required this.flutterLogoSize, 
    required this.flutterLogoLeftMargin, 
    required this.titleStyle,
    required this.subtitleStyle,
    required this.content1Style,
    required this.content2Style,
    required this.columnAlignment,
    required this.contentAlignment,
    required this.contentWidth,
    required this.textAlign,
    required this.textGap,
});

  final double bannerHeight;
  final EdgeInsets bannerMargin;
  final Alignment dashAlignment;
  final double dashSize;
  final double dashBottomOffset;
  final double flutterLogoSize;
  final double flutterLogoLeftMargin;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final TextStyle content1Style;
  final TextStyle content2Style;
  final CrossAxisAlignment columnAlignment;
  final Alignment contentAlignment;
  final double contentWidth;
  final TextAlign textAlign;
  final SizedBox textGap;

  static FarewellPageResponsiveConfig getFarewellPageConfig(BuildContext ctxt) {
    final config = getValueForScreenType(context: ctxt,
      mobile: FarewellPageResponsiveConfig(
        textAlign: TextAlign.center,
        columnAlignment: CrossAxisAlignment.center,
        contentWidth: MediaQuery.sizeOf(ctxt).width,
        contentAlignment: Alignment.topCenter,
        bannerHeight: 700,
        bannerMargin: FlutterConfLatamStyles.largeMargin,
        dashAlignment: Alignment.bottomCenter,
        dashSize: 400.0,
        dashBottomOffset: -40,
        flutterLogoSize: 300.0,
        flutterLogoLeftMargin: 0.0,
        titleStyle: FlutterConfLatamStyles.h3,
        subtitleStyle: FlutterConfLatamStyles.h6,
        content1Style: FlutterConfLatamStyles.h7.copyWith(
          fontWeight: FontWeight.normal,
        ),
        content2Style: FlutterConfLatamStyles.h7,
        textGap: FlutterConfLatamStyles.xsmallVGap,
      ),
      tablet: FarewellPageResponsiveConfig(
        contentWidth: MediaQuery.sizeOf(ctxt).width / 2,
        textAlign: TextAlign.left,
        columnAlignment: CrossAxisAlignment.start,
        contentAlignment: Alignment.centerLeft,
        bannerHeight: 600,
        bannerMargin: FlutterConfLatamStyles.largeMargin,
        dashAlignment: Alignment.bottomRight,
        dashSize: 500.0,
        dashBottomOffset: -60,
        flutterLogoSize: 400.0,
        flutterLogoLeftMargin: 60.0,
        titleStyle: FlutterConfLatamStyles.h3,
        subtitleStyle: FlutterConfLatamStyles.h5,
        content1Style: FlutterConfLatamStyles.h7.copyWith(
          fontWeight: FontWeight.normal,
        ),
        content2Style: FlutterConfLatamStyles.h7,
        textGap: FlutterConfLatamStyles.smallVGap,
      ),
      desktop: FarewellPageResponsiveConfig(
        textAlign: TextAlign.left,
        contentWidth: MediaQuery.sizeOf(ctxt).width / 2,
        columnAlignment: CrossAxisAlignment.start,
        contentAlignment: Alignment.centerLeft,
        bannerHeight: 600,
        bannerMargin: FlutterConfLatamStyles.xLargeMargin,
        dashAlignment: Alignment.bottomRight,
        dashSize: 800.0,
        dashBottomOffset: -20,
        flutterLogoSize: 400.0,
        flutterLogoLeftMargin: 80.0,
        titleStyle: FlutterConfLatamStyles.h1,
        subtitleStyle: FlutterConfLatamStyles.h5,
        content1Style: FlutterConfLatamStyles.h7.copyWith(
          fontWeight: FontWeight.normal,
        ),
        content2Style: FlutterConfLatamStyles.h6,
        textGap: FlutterConfLatamStyles.smallVGap,
      ),
    );

    return config;
  }
}

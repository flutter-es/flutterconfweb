import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CFPBannerResponsiveConfig {
  const CFPBannerResponsiveConfig({
    required this.bannerHeight,
    required this.logoAlignment,
    required this.dashAlignment,
    required this.dashSize,
    required this.dashBottomOffset,
    required this.flutterLogoSize,
    required this.flutterLogoLeftMargin,
    required this.cfpButtonAlignment,
    required this.cfpButtonIconSize,
    required this.cfpButtonLabelSize,
    required this.cfpButtonIconPadding,
    required this.cfpButtonMargin,
    required this.bannerGradient,
  });

  final double bannerHeight;
  final Alignment logoAlignment;
  final Alignment dashAlignment;
  final double dashSize;
  final double dashBottomOffset;
  final double flutterLogoSize;
  final double flutterLogoLeftMargin;
  final Alignment cfpButtonAlignment;
  final double cfpButtonIconSize;
  final double cfpButtonLabelSize;
  final double cfpButtonIconPadding;
  final double cfpButtonMargin;
  final LinearGradient bannerGradient;

  static CFPBannerResponsiveConfig getCFPBannerConfig(BuildContext ctxt) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: const CFPBannerResponsiveConfig(
        bannerHeight: 700,
        logoAlignment: Alignment.topCenter,
        dashAlignment: Alignment.bottomCenter,
        dashSize: 400.0,
        dashBottomOffset: -40,
        flutterLogoSize: 300.0,
        flutterLogoLeftMargin: 0.0,
        cfpButtonAlignment: Alignment.center,
        cfpButtonIconSize: 20.0,
        cfpButtonLabelSize: 20.0,
        cfpButtonIconPadding: 10.0,
        cfpButtonMargin: 0.0,
        bannerGradient: LinearGradient(
          colors: [Colors.white, FlutterLatamColors.cfpColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      tablet: const CFPBannerResponsiveConfig(
        bannerHeight: 600,
        logoAlignment: Alignment.topLeft,
        dashAlignment: Alignment.bottomRight,
        dashSize: 500.0,
        dashBottomOffset: -60,
        flutterLogoSize: 400.0,
        flutterLogoLeftMargin: 60.0,
        cfpButtonAlignment: Alignment.bottomLeft,
        cfpButtonIconSize: 20.0,
        cfpButtonLabelSize: 30.0,
        cfpButtonIconPadding: 20.0,
        cfpButtonMargin: 60.0,
        bannerGradient: LinearGradient(
          colors: [Colors.white, FlutterLatamColors.cfpColor],
        ),
      ),
      desktop: const CFPBannerResponsiveConfig(
        bannerHeight: 600,
        logoAlignment: Alignment.topLeft,
        dashAlignment: Alignment.bottomRight,
        dashSize: 800.0,
        dashBottomOffset: -20,
        flutterLogoSize: 400.0,
        flutterLogoLeftMargin: 80.0,
        cfpButtonAlignment: Alignment.bottomLeft,
        cfpButtonIconSize: 20.0,
        cfpButtonLabelSize: 30.0,
        cfpButtonIconPadding: 20.0,
        cfpButtonMargin: 80.0,
        bannerGradient: LinearGradient(
          colors: [Colors.white, FlutterLatamColors.cfpColor],
        ),
      ),
    );

    return config;
  }
}

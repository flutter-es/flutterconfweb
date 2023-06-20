import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationResponsiveConfig {

  const NavigationResponsiveConfig({
    required this.languageButtonWidth,
    required this.footerLayoutDirection,
    required this.footerItemsGap,
    required this.logoHeight,
    required this.maxHeaderHeight,
    required this.showLogoOnFooter,
    required this.footerPadding,
  });

  final double languageButtonWidth;
  final Axis footerLayoutDirection;
  final SizedBox footerItemsGap;
  final double logoHeight;
  final double maxHeaderHeight;
  final bool showLogoOnFooter;
  final double footerPadding;

  static NavigationResponsiveConfig getNavigationConfig(BuildContext ctxt) {

    final config = getValueForScreenType(context: ctxt,
      mobile: const NavigationResponsiveConfig(
        logoHeight: 120,
        maxHeaderHeight: 120,
        languageButtonWidth: 100,
        footerLayoutDirection: Axis.vertical,
        footerItemsGap: FlutterConfLatamStyles.xsmallVGap,
        showLogoOnFooter: false,
        footerPadding: 10,
      ),
      tablet: const NavigationResponsiveConfig(
        logoHeight: 180,
        maxHeaderHeight: 180,
        languageButtonWidth: 140,
        footerLayoutDirection: Axis.horizontal,
        footerItemsGap: FlutterConfLatamStyles.smallHGap,
        showLogoOnFooter: true,
        footerPadding: 20,
      ),
      desktop: const NavigationResponsiveConfig(
        maxHeaderHeight: 120,
        logoHeight: 220,
        languageButtonWidth: 180,
        footerLayoutDirection: Axis.horizontal,
        footerItemsGap: FlutterConfLatamStyles.smallHGap,
        showLogoOnFooter: true,
        footerPadding: 30
      ),
    );

    return config;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationResponsiveConfig {

  const NavigationResponsiveConfig({
    required this.languageButtonWidth,
    required this.footerLayoutDirection,
    required this.footerItemsGap,
  });

  final double languageButtonWidth;
  final Axis footerLayoutDirection;
  final SizedBox footerItemsGap;

  static NavigationResponsiveConfig getNavigationConfig(BuildContext ctxt) {

    final config = getValueForScreenType(context: ctxt,
      mobile: const NavigationResponsiveConfig(
        languageButtonWidth: 100,
        footerLayoutDirection: Axis.vertical,
        footerItemsGap: FlutterConfLatamStyles.smallVGap,
      ),
      tablet: const NavigationResponsiveConfig(
        languageButtonWidth: 180,
        footerLayoutDirection: Axis.horizontal,
        footerItemsGap: FlutterConfLatamStyles.smallHGap,
      ),
      desktop: const NavigationResponsiveConfig(
        languageButtonWidth: 180,
        footerLayoutDirection: Axis.horizontal,
        footerItemsGap: FlutterConfLatamStyles.smallHGap,
      ),
    );

    return config;
  }
}

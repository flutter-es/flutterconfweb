import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SpeakersResponsiveConfig {
  SpeakersResponsiveConfig({
    required this.titleSize,
    required this.buttonLabelSize,
    required this.buttonPadding,
    required this.bannerMargin,
    required this.bannerPadding,
  });

  final double titleSize;
  final double buttonLabelSize;
  final EdgeInsets buttonPadding;
  final EdgeInsets bannerPadding;
  final EdgeInsets bannerMargin;

  static SpeakersResponsiveConfig getSpeakersBannerConfig(BuildContext ctxt) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: SpeakersResponsiveConfig(
        titleSize: 15,
        buttonLabelSize: 20,
        buttonPadding: FlutterConfLatamStyles.smallPadding,
        bannerPadding: FlutterConfLatamStyles.mediumPadding,
        bannerMargin: FlutterConfLatamStyles.mediumMargin,
      ),
      tablet: SpeakersResponsiveConfig(
        titleSize: 20,
        buttonLabelSize: 20,
        buttonPadding: FlutterConfLatamStyles.smallPadding,
        bannerPadding: FlutterConfLatamStyles.mediumPadding,
        bannerMargin: FlutterConfLatamStyles.mediumMargin,
      ),
      desktop: SpeakersResponsiveConfig(
        titleSize: 30,
        buttonLabelSize: 30,
        buttonPadding: FlutterConfLatamStyles.mediumPadding,
        bannerPadding: FlutterConfLatamStyles.largePadding,
        bannerMargin: FlutterConfLatamStyles.largeMargin,
      ),
    );

    return config;
  }
}

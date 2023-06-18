import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SpeakersResponsiveConfig {
  SpeakersResponsiveConfig(
      {required this.titleSize,
      required this.buttonLabelSize,
      required this.buttonPadding});

  final double titleSize;
  final double buttonLabelSize;
  final EdgeInsets buttonPadding;

  static SpeakersResponsiveConfig getSpeakersBannerConfig(BuildContext ctxt) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: SpeakersResponsiveConfig(
        titleSize: 15,
        buttonLabelSize: 20,
        buttonPadding: FlutterConfLatamStyles.smallPadding,
      ),
      tablet: SpeakersResponsiveConfig(
        titleSize: 20,
        buttonLabelSize: 20,
        buttonPadding: FlutterConfLatamStyles.smallPadding,
      ),
      desktop: SpeakersResponsiveConfig(
        titleSize: 30,
        buttonLabelSize: 30,
        buttonPadding: FlutterConfLatamStyles.mediumPadding,
      ),
    );

    return config;
  }
}

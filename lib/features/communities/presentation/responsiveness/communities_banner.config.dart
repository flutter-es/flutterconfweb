import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CommunitiesBannerResponsiveConfig {
  CommunitiesBannerResponsiveConfig({
    required this.titleStyle,
    required this.subTitleStyle,
    required this.bannerMargin,
    required this.bannerPadding,
  });

  final TextStyle titleStyle;
  final TextStyle subTitleStyle;
  final EdgeInsets bannerPadding;
  final EdgeInsets bannerMargin;

  static CommunitiesBannerResponsiveConfig getCommunitiesBannerConfig(
    BuildContext ctxt,
  ) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: CommunitiesBannerResponsiveConfig(
        titleStyle: FlutterConfLatamStyles.h4,
        subTitleStyle: FlutterConfLatamStyles.h6,
        bannerPadding: FlutterConfLatamStyles.mediumPadding,
        bannerMargin: FlutterConfLatamStyles.mediumMargin,
      ),
      tablet: CommunitiesBannerResponsiveConfig(
        titleStyle: FlutterConfLatamStyles.h3,
        subTitleStyle: FlutterConfLatamStyles.h5,
        bannerPadding: FlutterConfLatamStyles.mediumPadding,
        bannerMargin: FlutterConfLatamStyles.mediumMargin,
      ),
      desktop: CommunitiesBannerResponsiveConfig(
        titleStyle: FlutterConfLatamStyles.h2,
        subTitleStyle: FlutterConfLatamStyles.h4,
        bannerPadding: FlutterConfLatamStyles.largePadding,
        bannerMargin: FlutterConfLatamStyles.largeMargin,
      ),
    );

    return config;
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EventFeatureResponsiveConfig {
  const EventFeatureResponsiveConfig({
    required this.childrenAxis,
    required this.bannerHeight,
    required this.bannerPadding,
    required this.labelSize,
  });

  final Axis childrenAxis;
  final double bannerHeight;
  final double bannerPadding;
  final double labelSize;

  static EventFeatureResponsiveConfig getEventFeatureBannerConfig(
    BuildContext ctxt,
  ) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: const EventFeatureResponsiveConfig(
        childrenAxis: Axis.vertical,
        bannerHeight: 900,
        bannerPadding: 60,
        labelSize: 20,
      ),
      tablet: const EventFeatureResponsiveConfig(
        childrenAxis: Axis.horizontal,
        bannerHeight: 400,
        bannerPadding: 0,
        labelSize: 25,
      ),
      desktop: const EventFeatureResponsiveConfig(
        childrenAxis: Axis.horizontal,
        bannerHeight: 500,
        bannerPadding: 0,
        labelSize: 30,
      ),
    );

    return config;
  }
}

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeSectionResponsiveConfig {
  const HomeSectionResponsiveConfig({
    required this.dashBottomOffset,
    required this.titleSize,
    required this.subtitleSize,
    required this.buttonLabelSize,
    required this.buttonIconSize,
    required this.buttonIconPadding,
    required this.dateSize,
    required this.flagSize,
    required this.layoutDirection,
    required this.textAlign,
    required this.sectionPadding,
    required this.countryLabelSize,
    required this.dashSize,
    required this.pageTopGap,
    required this.bannerHeight,
    required this.buttonRowAlignment,
    required this.dateCountryRowAlignment,
    required this.buttonBottomGap,
    required this.titleAlignment,
  });

  final double titleSize;
  final double subtitleSize;
  final double buttonLabelSize;
  final double buttonIconSize;
  final double buttonIconPadding;
  final double sectionPadding;
  final double dateSize;
  final double flagSize;
  final Axis layoutDirection;
  final TextAlign textAlign;
  final double countryLabelSize;
  final double dashSize;
  final double pageTopGap;
  final double bannerHeight;
  final MainAxisAlignment buttonRowAlignment;
  final MainAxisAlignment dateCountryRowAlignment;
  final double? dashBottomOffset;
  final double buttonBottomGap;
  final CrossAxisAlignment titleAlignment;

  static HomeSectionResponsiveConfig getHomeSectionBannerConfig(
      BuildContext ctxt) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: const HomeSectionResponsiveConfig(
        titleAlignment: CrossAxisAlignment.center,
        titleSize: 40,
        subtitleSize: 20,
        buttonLabelSize: 15,
        buttonIconSize: 20,
        buttonIconPadding: 15,
        dateSize: 20,
        flagSize: 20,
        layoutDirection: Axis.vertical,
        textAlign: TextAlign.center,
        sectionPadding: 35,
        countryLabelSize: 20,
        dashSize: 300,
        pageTopGap: 0,
        bannerHeight: 500,
        buttonRowAlignment: MainAxisAlignment.center,
        dateCountryRowAlignment: MainAxisAlignment.center,
        dashBottomOffset: -110,
        buttonBottomGap: 20,
      ),
      tablet: const HomeSectionResponsiveConfig(
        titleAlignment: CrossAxisAlignment.center,
        titleSize: 50,
        subtitleSize: 20,
        buttonLabelSize: 20,
        buttonIconSize: 20,
        buttonIconPadding: 20,
        dateSize: 20,
        flagSize: 20,
        layoutDirection: Axis.vertical,
        textAlign: TextAlign.center,
        sectionPadding: 55,
        countryLabelSize: 20,
        dashSize: 600,
        pageTopGap: 0,
        bannerHeight: 700,
        buttonRowAlignment: MainAxisAlignment.center,
        dateCountryRowAlignment: MainAxisAlignment.center,
        dashBottomOffset: -150.0,
        buttonBottomGap: 40,
      ),
      desktop: HomeSectionResponsiveConfig(
        titleAlignment: CrossAxisAlignment.start,
        titleSize: HomeSectionResponsiveConfig.titleDesktopSize(ctxt, 70),
        subtitleSize: HomeSectionResponsiveConfig.subtitleDesktopSize(ctxt, 30),
        buttonLabelSize: 30,
        buttonIconSize: 30,
        buttonIconPadding: 20,
        dateSize: 30,
        flagSize: 40,
        layoutDirection: Axis.horizontal,
        textAlign: TextAlign.left,
        sectionPadding: 85,
        countryLabelSize: 30,
        dashSize: 800,
        pageTopGap: 80,
        bannerHeight: 600,
        buttonRowAlignment: MainAxisAlignment.start,
        dateCountryRowAlignment: MainAxisAlignment.start,
        dashBottomOffset:
            HomeSectionResponsiveConfig.dashOffsetSize(ctxt, -300.0),
        buttonBottomGap: 60,
      ),
    );

    return config;
  }

  static double titleDesktopSize(BuildContext context, double originalValue) {
    final width = MediaQuery.of(context).size.width;
    var fontSize = originalValue;

    if (width < 1260) {
      fontSize = 60;
    }
    if (width < 1000) {
      fontSize = 50;
    }

    return fontSize;
  }

  static double subtitleDesktopSize(
      BuildContext context, double originalValue) {
    final width = MediaQuery.of(context).size.width;
    var fontSize = originalValue;

    if (width < 1260) {
      fontSize = 24;
    }

    if (width < 1000) {
      fontSize = 18;
    }

    return fontSize;
  }

  static double dashOffsetSize(BuildContext context, double originalValue) {
    final width = MediaQuery.of(context).size.width;
    final offset = originalValue;

    if (width > 1500) {
      return -300;
    }

    if (width > 1300) {
      return -350;
    }

    if (width > 1260) {
      return -380;
    }

    if (width > 900) {
      return -400;
    }

    return offset;
  }
}

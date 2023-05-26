import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeSectionResponsiveConfig {

  const HomeSectionResponsiveConfig({
    required this.dashLeftPosition,
    required this.titleSize,
    required this.contentSize,
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
  });

  final double titleSize;
  final double contentSize;
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
  final double? dashLeftPosition;
  final double buttonBottomGap;

  static HomeSectionResponsiveConfig getHomeSectionBannerConfig(BuildContext ctxt) {

    final config = getValueForScreenType(context: ctxt,
      mobile: const HomeSectionResponsiveConfig(
        titleSize: 30,
        contentSize: 20,
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
        bannerHeight: 900,
        buttonRowAlignment: MainAxisAlignment.center,
        dateCountryRowAlignment: MainAxisAlignment.center,
        dashLeftPosition: 0,
        buttonBottomGap: 20,
      ),
      tablet: const HomeSectionResponsiveConfig(
        titleSize: 40,
        contentSize: 20,
        buttonLabelSize: 20,
        buttonIconSize: 20,
        buttonIconPadding: 20,
        dateSize: 20,
        flagSize: 20,
        layoutDirection: Axis.vertical,
        textAlign: TextAlign.center,
        sectionPadding: 85,
        countryLabelSize: 20,
        dashSize: 500,
        pageTopGap: 0,
        bannerHeight: 1200,
        buttonRowAlignment: MainAxisAlignment.center,
        dateCountryRowAlignment: MainAxisAlignment.center,
        dashLeftPosition: null,
        buttonBottomGap: 40,
      ),
      desktop: const HomeSectionResponsiveConfig(
        titleSize: 50,
        contentSize: 20,
        buttonLabelSize: 30,
        buttonIconSize: 30,
        buttonIconPadding: 20,
        dateSize: 30,
        flagSize: 40,
        layoutDirection: Axis.horizontal,
        textAlign: TextAlign.left,
        sectionPadding: 85,
        countryLabelSize: 30,
        dashSize: 700,
        pageTopGap: 80,
        bannerHeight: 700,
        buttonRowAlignment: MainAxisAlignment.start,
        dateCountryRowAlignment: MainAxisAlignment.start,
        dashLeftPosition: null,
        buttonBottomGap: 60,
      ),
    );

    return config;
  }
}

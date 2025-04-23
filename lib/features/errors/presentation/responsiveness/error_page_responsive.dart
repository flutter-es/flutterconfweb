part of '../pages/error_page.dart';

class _ErrorPageResponsiveConfig {
  _ErrorPageResponsiveConfig({
    required this.titleSize,
    required this.subtitleSize,
    required this.dashDimensions,
    required this.textContainerWidth,
  });

  final double titleSize;
  final double subtitleSize;
  final double dashDimensions;
  final double textContainerWidth;
}

_ErrorPageResponsiveConfig _responsiveConfig(BuildContext context) {
  return getValueForScreenType(
    context: context,
    mobile: _ErrorPageResponsiveConfig(
      titleSize: 40,
      subtitleSize: 20,
      dashDimensions: 250,
      textContainerWidth: 250,
    ),
    tablet: _ErrorPageResponsiveConfig(
      titleSize: 50,
      subtitleSize: 20,
      dashDimensions: 300,
      textContainerWidth: 300,
    ),
    desktop: _ErrorPageResponsiveConfig(
      titleSize: 60,
      subtitleSize: 30,
      dashDimensions: 400,
      textContainerWidth: 400,
    ),
  );
}

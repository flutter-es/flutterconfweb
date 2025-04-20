import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/helpers/enums.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FlutterConfLatamStyles {
  static const double xSmallSize = 4;
  static const double smallSize = 8;
  static const double mediumSize = 16;
  static const double largeSize = 32;
  static const double xLargeSize = 64;
  static const double xxLargeSize = 128;

  static const double xSmallRadius = 12;
  static const double smallRadius = 24;
  static const double mediumRadius = 40;
  static const double largeRadius = 64;
  static const double xlargeRadius = 80;

  static const xSmallVGap = SizedBox(height: 10);
  static const smallVGap = SizedBox(height: 20);
  static const mediumVGap = SizedBox(height: 40);
  static const largeVGap = SizedBox(height: 60);

  static const xSmallHGap = SizedBox(width: 10);
  static const smallHGap = SizedBox(width: 20);
  static const mediumHGap = SizedBox(width: 40);
  static const largeHGap = SizedBox(width: 60);

  static const bannerPadding = EdgeInsets.all(40);

  static const xSmallPadding = EdgeInsets.all(4);
  static const smallPadding = EdgeInsets.all(8);
  static const mediumPadding = EdgeInsets.all(16);
  static const largePadding = EdgeInsets.all(32);
  static const xLargePadding = EdgeInsets.all(64);
  static const xxLargePadding = EdgeInsets.all(128);

  static const smallMargin = EdgeInsets.all(8);
  static const mediumMargin = EdgeInsets.all(16);
  static const largeMargin = EdgeInsets.all(32);
  static const xLargeMargin = EdgeInsets.all(64);
  static const xxLargeMargin = EdgeInsets.all(128);

  static const h1 = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.bold,
    color: FlutterLatamColors.blueText,
  );
  static const h2 = TextStyle(
    fontSize: 56,
    fontWeight: FontWeight.bold,
    color: FlutterLatamColors.blueText,
  );
  static const h3 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: FlutterLatamColors.blueText,
  );
  static const h4 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: FlutterLatamColors.blueText,
  );
  static const h5 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: FlutterLatamColors.blueText,
  );
  static const h6 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: FlutterLatamColors.blueText,
  );
  static const h7 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: FlutterLatamColors.blueText,
  );
  static const h8 = TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.bold,
    color: FlutterLatamColors.blueText,
  );

  static const label1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const label2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const label3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const label4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const label5 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const label6 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const label7 = TextStyle(
    fontSize: 8,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const label8 = TextStyle(
    fontSize: 4,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle getStylesFromSessionType(
    BuildContext context,
    SessionType sessionType,
  ) {
    switch (sessionType) {
      case SessionType.eventSession:
        return getValueForScreenType(
          context: context,
          mobile: h7,
          tablet: h6,
          desktop: h6,
        );
      default:
        return h7.copyWith(color: Colors.black);
    }
  }
}

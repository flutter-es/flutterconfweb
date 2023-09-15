import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';

class FlutterConfLatamStyles {

  static const double xsmallSize = 4;
  static const double smallSize = 8;
  static const double mediumSize = 16;
  static const double largeSize = 32;
  static const double xLargeSize = 64;
  static const double xxLargeSize = 128;

  static const double xsmallRadius = 12;
  static const double smallRadius = 24;
  static const double mediumRadius = 40;
  static const double largeRadius = 64;
  static const double xlargeRadius = 80;

  static const SizedBox xsmallVGap = SizedBox(height: 10);
  static const SizedBox smallVGap = SizedBox(height: 20);
  static const SizedBox mediumVGap = SizedBox(height: 40);
  static const SizedBox largeVGap = SizedBox(height: 60);

  static const SizedBox xsmallHGap = SizedBox(width: 10);
  static const SizedBox smallHGap = SizedBox(width: 20);
  static const SizedBox mediumHGap = SizedBox(width: 40);
  static const SizedBox largeHGap = SizedBox(width: 60);

  static const EdgeInsets bannerPadding = EdgeInsets.all(40);

  static const EdgeInsets xsmallPadding = EdgeInsets.all(4);
  static const EdgeInsets smallPadding = EdgeInsets.all(8);
  static const EdgeInsets mediumPadding = EdgeInsets.all(16);
  static const EdgeInsets largePadding = EdgeInsets.all(32);
  static const EdgeInsets xLargePadding = EdgeInsets.all(64);
  static const EdgeInsets xxLargePadding = EdgeInsets.all(128);

  static const EdgeInsets smallMargin = EdgeInsets.all(8);
  static const EdgeInsets mediumMargin = EdgeInsets.all(16);
  static const EdgeInsets largeMargin = EdgeInsets.all(32);
  static const EdgeInsets xLargeMargin = EdgeInsets.all(64);
  static const EdgeInsets xxLargeMargin = EdgeInsets.all(128);

  static const TextStyle h1 = TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: FlutterLatamColors.blueText);
  static const TextStyle h2 = TextStyle(fontSize: 56, fontWeight: FontWeight.bold, color: FlutterLatamColors.blueText);
  static const TextStyle h3 = TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: FlutterLatamColors.blueText);
  static const TextStyle h4 = TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: FlutterLatamColors.blueText);
  static const TextStyle h5 = TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: FlutterLatamColors.blueText);
  static const TextStyle h6 = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: FlutterLatamColors.blueText);
  static const TextStyle h7 = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: FlutterLatamColors.blueText);
  static const TextStyle h8 = TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: FlutterLatamColors.blueText);

  static const TextStyle label1 = TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black);
  static const TextStyle label2 = TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black);
  static const TextStyle label3 = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black);
  static const TextStyle label4 = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  static const TextStyle label5 = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
  static const TextStyle label6 = TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black);
  static const TextStyle label7 = TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.black);
  static const TextStyle label8 = TextStyle(fontSize: 4, fontWeight: FontWeight.bold, color: Colors.black);


  static TextStyle getStylesFromSessionType(SessionType sessionType) {
    switch(sessionType) {
      case SessionType.eventSession:
        return h6;
      default:
        return h7.copyWith(color: Colors.black);
    }
  }
}

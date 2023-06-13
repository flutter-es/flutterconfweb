/// Flutter icons FlutterConfLatamIcons
/// Copyright (C) 2023 by original authors @ fluttericon.com, fontello.com
/// This font was generated by FlutterIcon.com, which is derived from Fontello.
///
/// To use this font, place it in your fonts/ directory and include the
/// following in your pubspec.yaml
///
/// flutter:
///   fonts:
///    - family:  FlutterConfLatamIcons
///      fonts:
///       - asset: fonts/FlutterConfLatamIcons.ttf
///
/// 
///
import 'package:flutter/widgets.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';

class FlutterConfLatamIcons {
  FlutterConfLatamIcons._();

  static const _kFontFam = 'FlutterConfLatamIcons';
  static const String? _kFontPkg = null;

  static const IconData facebook = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData flutteconflatam_text = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData flutter = IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData instagram = IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData linkedin = IconData(0xe804, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData menu = IconData(0xe805, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData speaker = IconData(0xe806, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData ticket = IconData(0xe807, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData tracks = IconData(0xe808, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData tiktok = IconData(0xe809, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData twitter = IconData(0xe80a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData youtube = IconData(0xe80b, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  static IconData getIconFromEnum(SocialMediaLinks social) {
    switch(social) {
      case SocialMediaLinks.twitter:
        return twitter;
      case SocialMediaLinks.linkedin:
        return linkedin;
      default:
        return twitter;
    }
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_conf_latam/helpers/enums.dart';

class FlutterConfLatamIcons {
  FlutterConfLatamIcons._();

  static const _kFontFam = 'FlutterConfLatamIcons';

  static const IconData facebook = IconData(0xe800, fontFamily: _kFontFam);
  static const IconData flutterConfLatamText = IconData(
    0xe801,
    fontFamily: _kFontFam,
  );
  static const IconData flutter = IconData(0xe802, fontFamily: _kFontFam);
  static const IconData instagram = IconData(0xe803, fontFamily: _kFontFam);
  static const IconData linkedin = IconData(0xe804, fontFamily: _kFontFam);
  static const IconData menu = IconData(0xe805, fontFamily: _kFontFam);
  static const IconData speaker = IconData(0xe806, fontFamily: _kFontFam);
  static const IconData ticket = IconData(0xe807, fontFamily: _kFontFam);
  static const IconData tracks = IconData(0xe808, fontFamily: _kFontFam);
  static const IconData tiktok = IconData(0xe809, fontFamily: _kFontFam);
  static const IconData twitter = IconData(0xe80a, fontFamily: _kFontFam);
  static const IconData youtube = IconData(0xe80b, fontFamily: _kFontFam);
  static const IconData github = IconData(0xf308, fontFamily: _kFontFam);

  static IconData getIconFromEnum(SocialMediaLinks social) {
    switch (social) {
      case SocialMediaLinks.twitter:
        return twitter;
      case SocialMediaLinks.linkedin:
        return linkedin;
      case SocialMediaLinks.github:
        return github;
    }
  }
}

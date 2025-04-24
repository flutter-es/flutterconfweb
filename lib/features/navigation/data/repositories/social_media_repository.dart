import 'package:flutter_conf_latam/features/navigation/data/models/social_media_model.dart';
import 'package:flutter_conf_latam/styles/flutter_conf_latam_icons_icons.dart';

class SocialMediaRepository {
  List<SocialMediaModel> getSocialMedia() {
    return const [
      SocialMediaModel(
        icon: FlutterConfLatamIcons.facebook,
        label: 'Facebook',
        link: 'https://facebook.com/flutterconflatam',
      ),
      SocialMediaModel(
        icon: FlutterConfLatamIcons.twitter,
        label: 'Twitter',
        link: 'https://twitter.com/flutterconflat',
      ),
      SocialMediaModel(
        icon: FlutterConfLatamIcons.instagram,
        label: 'Instagram',
        link: 'https://www.instagram.com/flutterconflatam/',
      ),
      SocialMediaModel(
        icon: FlutterConfLatamIcons.tiktok,
        label: 'TikTok',
        link: 'https://tiktok.com/@flutterconflatam',
      ),
      SocialMediaModel(
        icon: FlutterConfLatamIcons.linkedin,
        label: 'LinkedIn',
        link: 'https://www.linkedin.com/company/flutterconflatam/',
      ),
      SocialMediaModel(
        icon: FlutterConfLatamIcons.youtube,
        label: 'YouTube',
        link: 'https://youtube.com/@flutterconflatam',
      ),
    ];
  }
}

import 'package:flutter_conf_latam/features/navigation/data/models/social_media_model.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';

class SocialMediaRepository {
  List<SocialMediaModel> getSocialMedia() {
    return <SocialMediaModel>[
      SocialMediaModel(
        iconPath: Assets.images.icons.youtube,
        label: 'YouTube',
        link: 'https://youtube.com/@flutterconflatam',
      ),
      SocialMediaModel(
        iconPath: Assets.images.icons.linkedIn,
        label: 'LinkedIn',
        link: 'https://www.linkedin.com/company/flutterconflatam/',
      ),
      SocialMediaModel(
        iconPath: Assets.images.icons.tikTok,
        label: 'TikTok',
        link: 'https://tiktok.com/@flutterconflatam',
      ),
      SocialMediaModel(
        iconPath: Assets.images.icons.twitter,
        label: 'Twitter',
        link: 'https://twitter.com/flutterconflat',
      ),
      SocialMediaModel(
        iconPath: Assets.images.icons.facebook,
        label: 'Facebook',
        link: 'https://facebook.com/flutterconflatam',
      ),
      SocialMediaModel(
        iconPath: Assets.images.icons.instagram,
        label: 'Instagram',
        link: 'https://www.instagram.com/flutterconflatam/',
      ),
    ];
  }
}

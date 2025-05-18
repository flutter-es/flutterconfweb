import 'package:flutter_conf_latam/features/navigation/data/repositories/social_media_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final socialMediaProvider = Provider((_) {
  return SocialMediaRepository().getSocialMedia();
});

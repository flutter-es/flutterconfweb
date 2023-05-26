import 'package:flutter_conf_colombia/features/navigation/data/repositories/social_media.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final socialMediaRepositoryProvider = Provider((ref) {
  return SocialMediaRepository();
});

final socialMediaProvider = Provider((ref) {
  return ref.read(socialMediaRepositoryProvider).getSocialMedia();
});

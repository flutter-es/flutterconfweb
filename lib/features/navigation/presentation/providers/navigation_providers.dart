import 'package:flutter_conf_colombia/features/navigation/data/repositories/navigation.repository.dart';
import 'package:flutter_conf_colombia/features/navigation/data/repositories/social_media.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final socialMediaRepositoryProvider = Provider((ref) {
  return SocialMediaRepository();
});

final socialMediaProvider = Provider((ref) {
  return ref.read(socialMediaRepositoryProvider).getSocialMedia();
});

final navigationItemsRepositoryProvider = Provider((ref) {
  return NavigationRepository(ref);
});

final navigationItemsProvider = Provider((ref) {
  return ref.watch(navigationItemsRepositoryProvider).getNavigation();
});

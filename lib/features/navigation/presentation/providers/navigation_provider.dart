import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/features/navigation/data/models/tab_navigation_item.dart';
import 'package:flutter_conf_latam/features/navigation/data/repositories/navigation.repository.dart';
import 'package:flutter_conf_latam/features/navigation/data/repositories/social_media.repository.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/view_model/navigation_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final socialMediaRepositoryProvider = Provider((ref) {
  return SocialMediaRepository();
});

final socialMediaProvider = Provider((ref) {
  return ref.read(socialMediaRepositoryProvider).getSocialMedia();
});

final navigationRepositoryProvider = Provider((ref) {
  return NavigationRepository(ref);
});

final navigationViewmodelProvider =
    StateNotifierProvider<NavigationViewModel, List<TabNavigationItem>>((ref) {
      final items = ref.watch(navigationRepositoryProvider).getNavigation();
      return NavigationViewModel(ref.watch(webLocalStorageProvider), items);
    });

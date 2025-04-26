import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/features/navigation/data/models/navigation_item_model.dart';
import 'package:flutter_conf_latam/features/navigation/data/repositories/navigation_repository.dart';
import 'package:flutter_conf_latam/features/navigation/data/repositories/social_media_repository.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/view_model/navigation_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final socialMediaProvider = Provider((_) {
  return SocialMediaRepository().getSocialMedia();
});

final navigationViewmodelProvider =
    StateNotifierProvider<NavigationViewModel, List<NavigationItemModel>>((
      ref,
    ) {
      final items = NavigationRepository(ref).getNavigation();
      return NavigationViewModel(ref.watch(webLocalStorageProvider), items);
    });

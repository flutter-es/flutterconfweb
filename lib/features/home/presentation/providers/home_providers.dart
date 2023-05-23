import 'package:flutter_conf_colombia/features/home/data/repositories/event_feature.repository.dart';
import 'package:flutter_conf_colombia/features/home/data/repositories/home_container_repository.dart';
import 'package:flutter_conf_colombia/features/home/data/repositories/home_sections.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eventFeaturesRepositoryProvider = Provider((ref) {
  return EventFeatureRepository(ref);
});

final eventFeaturesListProvider = Provider((ref) {
  return ref.watch(eventFeaturesRepositoryProvider).getEventFeatures();
});

final homeSectionsRepositoryProvider = Provider((ref) {
  return HomeSectionsRepository(ref);
});

final homeContainerRepositoryProvider = Provider((ref) {
  return HomeContainerRepository(ref);
});

final homeSectionsProvider = Provider((ref) {
  return ref.watch(homeSectionsRepositoryProvider).getHomeSections();
});

final homeContainerDataProvider = Provider((ref) {
  return ref.watch(homeContainerRepositoryProvider).getHomeContainerContent();
});

import 'package:flutter_conf_latam/features/home/data/repositories/datelocation_container.repository.dart';
import 'package:flutter_conf_latam/features/home/data/repositories/event_feature.repository.dart';
import 'package:flutter_conf_latam/features/home/data/repositories/home_container_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eventFeaturesRepositoryProvider = Provider((ref) {
  return EventFeatureRepository(ref);
});

final eventFeaturesListProvider = Provider((ref) {
  return ref.watch(eventFeaturesRepositoryProvider).getEventFeatures();
});

final homeContainerRepositoryProvider = Provider((ref) {
  return HomeContainerRepository(ref);
});

final homeContainerDataProvider = Provider((ref) {
  return ref.watch(homeContainerRepositoryProvider).getHomeContainerContent();
});

final dateLocationRepositoryProvider = Provider((ref) {
  return DateLocationRepository(ref);
});

final dateLocationProvider = Provider((ref) {
  return ref
      .watch(dateLocationRepositoryProvider)
      .getDateLocationContainerContent();
});

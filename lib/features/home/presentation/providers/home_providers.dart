import 'package:flutter_conf_latam/features/home/data/repositories/home_container_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeContainerRepositoryProvider = Provider((ref) {
  return HomeContainerRepository(ref);
});

final homeContainerDataProvider = Provider((ref) {
  return ref.watch(homeContainerRepositoryProvider).getHomeContainerContent();
});

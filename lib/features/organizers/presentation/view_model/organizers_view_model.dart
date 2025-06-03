import 'package:flutter_conf_latam/features/organizers/data/organizers_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final communitiesProvider = FutureProvider((ref) {
  return ref.watch(organizersRepositoryProvider).getCommunities();
});

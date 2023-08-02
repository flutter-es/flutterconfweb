import 'package:flutter_conf_colombia/features/communities/data/models/community_collab.model.dart';
import 'package:flutter_conf_colombia/features/communities/data/repositories/communities.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final communitiesRepositoryProvider = Provider((ref) {
  return CommunitiesRepository(ref);
});

final communitiesProvider = FutureProvider<List<CommunityCollabModel>>((ref) {
  return ref.read(communitiesRepositoryProvider).getCommunities();
});

import 'dart:async';
import 'package:flutter_conf_colombia/features/communities/data/models/community_collab.model.dart';
import 'package:flutter_conf_colombia/features/shared/providers/shared_providers.dart';
import 'package:flutter_conf_colombia/features/sponsors/data/models/sponsor.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunitiesRepository {
  const CommunitiesRepository(this.ref);

  final Ref ref;

  Future<List<CommunityCollabModel>> getCommunities() {
    final communitiesCompleter = Completer<List<CommunityCollabModel>>();

    final dbInstance = ref.read(dbProvider);
    dbInstance.collection('communities').get().then((snapshot) async {
      final communitiesList = snapshot.docs
          .map(
            (level) => CommunityCollabModel.fromFirestore(level.data()),
          )
          .toList();

      communitiesCompleter.complete(communitiesList);
    }).catchError((dynamic error) {
      communitiesCompleter.completeError(error.toString());
    }).onError((error, stackTrace) {
      communitiesCompleter.completeError(error.toString());
    });

    return communitiesCompleter.future;
  }
}

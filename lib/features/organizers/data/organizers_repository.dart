import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/features/organizers/domain/models/communities/communities_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrganizersRepository {
  OrganizersRepository(this.database);

  final FirebaseFirestore database;

  static const _communitiesCollection = 'communities';

  Future<List<CommunitiesModel>> getCommunities() async {
    final data = await database.collection(_communitiesCollection).get();
    return [
      for (final item in data.docs)
        CommunitiesModel.fromJson({'id': item.id, ...item.data()}),
    ];
  }
}

final organizersRepositoryProvider = Provider(
  (ref) => OrganizersRepository(ref.watch(firebaseFirestoreProvider)),
);

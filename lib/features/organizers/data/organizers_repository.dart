import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/features/organizers/domain/models/communities/communities_model.dart';
import 'package:flutter_conf_latam/features/organizers/domain/models/organizers/organizers_model.dart';
import 'package:signals/signals.dart';

class OrganizersRepository {
  OrganizersRepository(this.database);

  final FirebaseFirestore database;

  static const _organizersCollection = 'organizers';
  static const _communitiesCollection = 'communities';

  Future<List<OrganizersModel>> getOrganizers() async {
    final data = await database
        .collection(_organizersCollection)
        .where('is_visible', isEqualTo: true)
        .get();

    return [
      for (final item in data.docs)
        OrganizersModel.fromJson({'id': item.id, ...item.data()}),
    ];
  }

  Future<List<CommunitiesModel>> getCommunities() async {
    final data = await database.collection(_communitiesCollection).get();
    return [
      for (final item in data.docs)
        CommunitiesModel.fromJson({'id': item.id, ...item.data()}),
    ];
  }
}

final organizersRepository = computed(
  () => OrganizersRepository(firebaseFirestore.value),
);

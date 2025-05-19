import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/features/home/domain/models/communities/communities_model.dart';
import 'package:flutter_conf_latam/features/home/domain/models/faq/faq_model.dart';
import 'package:flutter_conf_latam/features/home/domain/models/tickets/tickets_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeRepository {
  HomeRepository(this.database);

  final FirebaseFirestore database;

  static const _communitiesCollection = 'communities';
  static const _ticketsCollection = 'tickets';
  static const _faqCollection = 'faq';

  Future<List<CommunitiesModel>> getCommunities() async {
    final data = await database.collection(_communitiesCollection).get();
    return [
      for (final item in data.docs)
        CommunitiesModel.fromJson({'id': item.id, ...item.data()}),
    ];
  }

  Future<List<TicketsModel>> getTickets() async {
    final collection = database.collection(_ticketsCollection);
    final data = await collection.where('isVisible', isEqualTo: true).get();

    return [
      for (final item in data.docs)
        TicketsModel.fromJson({'id': item.id, ...item.data()}),
    ];
  }

  Future<List<FaqModel>> getFaqData() async {
    final data = await database.collection(_faqCollection).get();
    return [
      for (final item in data.docs)
        FaqModel.fromJson({'id': item.id, ...item.data()}),
    ];
  }
}

final homeRepositoryProvider = Provider(
  (ref) => HomeRepository(ref.watch(firebaseFirestoreProvider)),
);

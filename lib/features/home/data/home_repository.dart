import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/features/home/domain/models/communities/communities_model.dart';
import 'package:flutter_conf_latam/features/home/domain/models/faq/faq_model.dart';
import 'package:flutter_conf_latam/features/home/domain/models/tickets/tickets_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeRepository {
  HomeRepository(this.database, this.functions);

  final FirebaseFirestore database;
  final FirebaseFunctions functions;

  static const _communitiesCollection = 'communities';

  static const _ticketsFunction = 'getTickets';
  static const _faqFunction = 'getFaqs';

  Future<List<CommunitiesModel>> getCommunities() async {
    final data = await database.collection(_communitiesCollection).get();
    return [
      for (final item in data.docs)
        CommunitiesModel.fromJson({'id': item.id, ...item.data()}),
    ];
  }

  Future<List<TicketsModel>> getTickets({String language = 'es'}) async {
    final callableMethod = functions.httpsCallable(_ticketsFunction);
    final response = await callableMethod.call<List<dynamic>>({
      'lang': language,
    });

    return [
      for (final item in response.data)
        TicketsModel.fromJson(item as Map<String, dynamic>),
    ];
  }

  Future<List<FaqModel>> getFaqData({String language = 'es'}) async {
    final callableMethod = functions.httpsCallable(_faqFunction);
    final response = await callableMethod.call<List<dynamic>>({
      'lang': language,
    });

    return [
      for (final item in response.data)
        FaqModel.fromJson(item as Map<String, dynamic>),
    ];
  }
}

final homeRepositoryProvider = Provider(
  (ref) => HomeRepository(
    ref.watch(firebaseFirestoreProvider),
    ref.watch(firebaseFunctionsProvider),
  ),
);

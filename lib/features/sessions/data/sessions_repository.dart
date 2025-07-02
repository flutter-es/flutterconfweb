import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/features/sessions/domain/models/session_response_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SessionsRepository {
  SessionsRepository(this.functions);

  final FirebaseFunctions functions;

  static const _sessionsFunction = 'getSessions';

  Future<List<SessionResponseModel>> getSessions({
    String language = 'es',
  }) async {
    final callableMethod = functions.httpsCallable(_sessionsFunction);
    final response = await callableMethod.call<List<dynamic>>({
      'lang': language,
    });

    return [
      for (final item in response.data)
        SessionResponseModel.fromJson(item as Map<String, dynamic>),
    ];
  }
}

final sessionsRepositoryProvider = Provider(
  (ref) => SessionsRepository(ref.watch(firebaseFunctionsProvider)),
);

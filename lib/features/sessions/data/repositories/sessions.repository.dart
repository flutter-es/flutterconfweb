import 'dart:async';
import 'package:flutter_conf_colombia/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_colombia/features/shared/providers/shared_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionsRepository {
  SessionsRepository(this.ref);

  final Ref ref;

  Future<List<SessionModel>> getSessions() {
    final sessionsCompleter = Completer<List<SessionModel>>();

    final dbInstance = ref.read(dbProvider);
    dbInstance.collection('sessions').get().then((snapshot) {
      final sessions = snapshot.docs
          .map(
            (sessionDoc) => SessionModel.fromFirestore(
              sessionDoc.data(),
            ),
          )
          .toList();

      sessionsCompleter.complete(sessions);
    }).catchError((dynamic error) {
      sessionsCompleter.completeError(error.toString());
    }).onError((error, stackTrace) {
      sessionsCompleter.completeError(error.toString());
    });

    return sessionsCompleter.future;
  }
}

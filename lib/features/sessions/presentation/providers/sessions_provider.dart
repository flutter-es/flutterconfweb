import 'package:flutter_conf_colombia/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_colombia/features/sessions/data/repositories/sessions.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sessionsRepositoryProvider = Provider((ref) {
  return SessionsRepository(ref);
});

final sessionsProvider = FutureProvider<List<SessionModel>>((ref) {
  return ref.read(sessionsRepositoryProvider).getSessions();
});
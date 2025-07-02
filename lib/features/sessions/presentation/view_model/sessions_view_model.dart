import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter_conf_latam/features/sessions/data/sessions_repository.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sessionsProvider = FutureProvider.family((ref, Locale locale) {
  return ref
      .watch(sessionsRepositoryProvider)
      .getSessions(language: locale.languageCode);
});

enum SessionDay {
  one(1),
  two(2);

  const SessionDay(this.value);

  final int value;
}

final sessionDayFilterProvider = StateProvider((ref) => SessionDay.one);

final filterSessionsProvider = FutureProvider((ref) async {
  final l10n = ref.watch(appLocalizationsProvider);
  final filter = ref.watch(sessionDayFilterProvider);

  final locale = Locale(l10n.localeName);
  final sessions = await ref.watch(sessionsProvider(locale).future);

  return switch (filter) {
    SessionDay.one => sessions.firstWhereOrNull((item) => item.day == 1),
    SessionDay.two => sessions.firstWhereOrNull((item) => item.day == 2),
  };
});

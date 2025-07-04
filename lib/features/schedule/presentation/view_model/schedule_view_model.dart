import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter_conf_latam/features/schedule/data/schedule_repository.dart';
import 'package:flutter_conf_latam/features/schedule/domain/models/schedule_response_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scheduleProvider = FutureProvider.family((ref, Locale locale) {
  return ref
      .watch(scheduleRepositoryProvider)
      .getSchedules(language: locale.languageCode);
});

final daysScheduleProvider = FutureProvider((ref) async {
  final l10n = ref.watch(appLocalizationsProvider);

  final locale = Locale(l10n.localeName);
  final schedule = await ref.watch(scheduleProvider(locale).future);

  return <ScheduleResponseModel?>[
    schedule.firstWhereOrNull((item) => item.day == 1),
    schedule.firstWhereOrNull((item) => item.day == 2),
  ];
});

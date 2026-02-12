import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter_conf_latam/features/schedule/data/schedule_repository.dart';
import 'package:flutter_conf_latam/features/schedule/domain/models/schedule_response_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scheduleProvider = FutureProvider((ref) {
  final localeName = ref.watch(appLocalizationsProvider).localeName;
  return ref
      .watch(scheduleRepositoryProvider)
      .getSchedules(language: Locale(localeName).languageCode);
});

final daysScheduleProvider = FutureProvider((ref) async {
  final schedule = await ref.watch(scheduleProvider.future);

  return <ScheduleDayModel?>[
    schedule.days.firstWhereOrNull((item) => item.day == 1),
    schedule.days.firstWhereOrNull((item) => item.day == 2),
  ];
});

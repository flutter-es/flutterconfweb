import 'dart:async';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter_conf_latam/features/schedule/data/schedule_repository.dart';
import 'package:flutter_conf_latam/features/schedule/domain/models/schedule_response_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:signals/signals.dart';

final scheduleSignal = futureSignal<ScheduleResponseModel>(() async {
  final localeName = appLocalizations.value.localeName;
  return scheduleRepository.value.getSchedules(
    language: Locale(localeName).languageCode,
  );
});

final daysScheduleSignal = computed<AsyncState<List<ScheduleDayModel?>>>(() {
  final scheduleState = scheduleSignal.value;

  return scheduleState.map(
    data: (schedule) {
      return AsyncState.data(<ScheduleDayModel?>[
        schedule.days.firstWhereOrNull((item) => item.day == 1),
        schedule.days.firstWhereOrNull((item) => item.day == 2),
      ]);
    },
    error: AsyncState<List<ScheduleDayModel?>>.error,
    loading: AsyncState<List<ScheduleDayModel?>>.loading,
  );
});

void reloadSchedule() {
  unawaited(scheduleSignal.reload());
}

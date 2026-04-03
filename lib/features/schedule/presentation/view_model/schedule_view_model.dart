import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_conf_common/flutter_conf_common.dart';
import 'package:flutter_conf_core/flutter_conf_core.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:signals/signals.dart';

final scheduleSignal = futureSignal<List<EventDayEntity>>(() async {
  final result = await eventDayRepository.value.listEventDaysByYear(year: 2026);
  return switch (result) {
    Success(:final data) => data,
    Failure(:final failure) => throw failure,
  };
});

final daysScheduleSignal = computed<AsyncState<List<EventDayEntity?>>>(() {
  final scheduleState = scheduleSignal.value;

  return scheduleState.map(
    data: (days) {
      return AsyncState.data(<EventDayEntity?>[
        days.firstWhereOrNull((item) => item.dayNumber == 1),
        days.firstWhereOrNull((item) => item.dayNumber == 2),
      ]);
    },
    error: AsyncState<List<EventDayEntity?>>.error,
    loading: AsyncState<List<EventDayEntity?>>.loading,
  );
});

void reloadSchedule() {
  unawaited(scheduleSignal.reload());
}

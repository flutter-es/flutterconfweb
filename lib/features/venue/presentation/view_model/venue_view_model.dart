import 'dart:async';

import 'package:flutter_conf_common/flutter_conf_common.dart';
import 'package:flutter_conf_core/flutter_conf_core.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:signals/signals.dart';

final venueSignal = futureSignal<VenueEntity>(() async {
  final result = await venueRepository.value.getVenueByYear(year: 2026);
  return switch (result) {
    Success(:final data) => data,
    Failure(:final failure) => throw failure,
  };
});

void reloadVenue() {
  unawaited(venueSignal.reload());
}

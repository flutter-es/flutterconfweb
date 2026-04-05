import 'dart:async';

import 'package:flutter_conf_common/flutter_conf_common.dart';
import 'package:flutter_conf_core/flutter_conf_core.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:signals/signals.dart';

final pricingSignal = futureSignal<List<TicketPricingEntity>>(() async {
  final result = await ticketPricingRepository.value.listActiveTicketPricing();
  return switch (result) {
    Success(:final data) => data.reversed.toList(),
    Failure(:final failure) => throw failure,
  };
});

void reloadPricing() {
  unawaited(pricingSignal.reload());
}

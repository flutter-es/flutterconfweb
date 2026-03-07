import 'dart:async';
import 'dart:ui';

import 'package:flutter_conf_latam/features/pricing/data/pricing_repository.dart';
import 'package:flutter_conf_latam/features/pricing/domain/models/tickets/tickets_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:signals/signals.dart';

final pricingSignal = futureSignal<List<TicketsModel>>(() async {
  final localeName = appLocalizations.value.localeName;
  return pricingRepository.value.getTickets(
    language: Locale(localeName).languageCode,
  );
});

void reloadPricing() {
  unawaited(pricingSignal.reload());
}

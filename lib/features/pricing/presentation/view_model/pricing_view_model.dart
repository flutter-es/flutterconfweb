import 'dart:ui';

import 'package:flutter_conf_latam/features/pricing/data/pricing_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pricingProvider = FutureProvider.family((ref, Locale locale) {
  return ref
      .watch(pricingRepositoryProvider)
      .getTickets(language: locale.languageCode);
});

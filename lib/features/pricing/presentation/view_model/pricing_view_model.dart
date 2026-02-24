import 'dart:ui';

import 'package:flutter_conf_latam/features/pricing/data/pricing_repository.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pricingProvider = FutureProvider((ref) {
  final localeName = ref.watch(appLocalizationsProvider).localeName;
  return ref
      .watch(pricingRepositoryProvider)
      .getTickets(language: Locale(localeName).languageCode);
});

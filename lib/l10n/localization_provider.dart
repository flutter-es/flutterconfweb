import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/l10n/generated/app_localizations.dart';
import 'package:flutter_conf_latam/l10n/support_locale.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentLocalizationProvider = StateProvider<Locale>((ref) {
  return SupportLocale.es;
});

final appLocalizationsProvider = Provider<AppLocalizations>((ref) {
  return lookupAppLocalizations(ref.watch(currentLocalizationProvider));
});

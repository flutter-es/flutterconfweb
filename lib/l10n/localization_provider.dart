import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final currentLocalizationProvider = StateProvider<Locale>((ref) {
  return WidgetsBinding.instance.platformDispatcher.locale;
});

final appLocalizationsProvider = Provider<AppLocalizations>((ref) {
  // 1. initialize from the initial locale
  return lookupAppLocalizations(ref.watch(currentLocalizationProvider));
});

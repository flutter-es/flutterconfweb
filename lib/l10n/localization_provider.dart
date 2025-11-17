// Set to allow setters methods
// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/l10n/gen/app_localizations.dart';
import 'package:flutter_conf_latam/l10n/support_locale.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrentLocalization extends Notifier<Locale> {
  @override
  Locale build() => SupportLocale.es;

  void update({required Locale newLocale}) {
    state = newLocale;
  }
}

final currentLocalizationProvider = NotifierProvider(
  CurrentLocalization.new,
);

final appLocalizationsProvider = Provider<AppLocalizations>((ref) {
  return lookupAppLocalizations(ref.watch(currentLocalizationProvider));
});

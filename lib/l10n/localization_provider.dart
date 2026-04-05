import 'dart:ui';

import 'package:flutter_conf_latam/l10n/gen/app_localizations.dart';
import 'package:flutter_conf_latam/l10n/support_locale.dart';
import 'package:signals/signals.dart';

final currentLocale = signal<Locale>(SupportLocale.es);

final appLocalizations = computed<AppLocalizations>(() {
  return lookupAppLocalizations(currentLocale.value);
});

void updateLocale(Locale newLocale) {
  currentLocale.value = newLocale;
}

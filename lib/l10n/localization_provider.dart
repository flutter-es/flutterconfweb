import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/l10n/support_locale.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'dart:ui' as ui;

final currentLocalizationProvider = StateProvider<Locale>((ref) {
  return ui.window.locale;
});

final appLocalizationsProvider = Provider<AppLocalizations>((ref) {
  // 1. initialize from the initial locale
  return lookupAppLocalizations(ref.watch(currentLocalizationProvider));
});

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/l10n/generated/app_localizations.dart';

extension BuildContextTranslateExtension on BuildContext {
  String menu(String key) {
    final instance = AppLocalizations.of(this);

    if (instance == null) return key;
    return instance.menu(key);
  }
}

extension CleanBreakLines on String {
  String get cleanBreakLines => replaceAll(r'\n', '\n');
}

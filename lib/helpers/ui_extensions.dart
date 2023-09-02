import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextTranslateExtension on BuildContext {
  String menu(String key) {
    final instance = AppLocalizations.of(this);

    if (instance == null) {
      return key;
    }

    return instance.menu(key);
  }
}

extension CleanBreakLines on String {
  String cleanBreakLines() {
    return replaceAll('\\n', '\n');
  }
}

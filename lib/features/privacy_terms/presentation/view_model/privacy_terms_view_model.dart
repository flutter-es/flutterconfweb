import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final privacyPolicyProvider = FutureProvider((ref) async {
  final localeName = ref.watch(appLocalizationsProvider).localeName;
  final filePath = switch (Locale(localeName).languageCode) {
    'en' => Assets.markdown.privacyPolicyEn,
    _ => Assets.markdown.privacyPolicyEs,
  };
  return rootBundle.loadString(filePath);
});

final termsProvider = FutureProvider((ref) async {
  final localeName = ref.watch(appLocalizationsProvider).localeName;
  final filePath = switch (Locale(localeName).languageCode) {
    'en' => Assets.markdown.termsAndConditionsEn,
    _ => Assets.markdown.termsAndConditionsEs,
  };
  return rootBundle.loadString(filePath);
});

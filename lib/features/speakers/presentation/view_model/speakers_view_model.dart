import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/features/speakers/data/speakers_repository.dart';
import 'package:flutter_conf_latam/features/speakers/domain/models/speaker_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final speakersRandomProvider = FutureProvider((ref) {
  final localeName = ref.watch(appLocalizationsProvider).localeName;
  return ref
      .watch(speakersRepositoryProvider)
      .getSpeakers(language: Locale(localeName).languageCode, isRandom: true);
});

final speakersProvider = FutureProvider((ref) {
  final localeName = ref.watch(appLocalizationsProvider).localeName;
  return ref
      .watch(speakersRepositoryProvider)
      .getSpeakers(language: Locale(localeName).languageCode);
});

final speakerProvider = FutureProvider.family<SpeakerModel, String>((ref, arg) {
  final localeName = ref.watch(appLocalizationsProvider).localeName;
  return ref
      .watch(speakersRepositoryProvider)
      .getSpeaker(speakerId: arg, language: Locale(localeName).languageCode);
});

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/features/speakers/data/speakers_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final speakersRandomProvider = FutureProvider.family((ref, Locale locale) {
  return ref
      .watch(speakersRepositoryProvider)
      .getSpeakers(language: locale.languageCode, isRandom: true);
});

final speakersProvider = FutureProvider.family((ref, Locale locale) {
  return ref
      .watch(speakersRepositoryProvider)
      .getSpeakers(language: locale.languageCode);
});

typedef SpeakerParam = ({String id, Locale locale});

final speakerProvider = FutureProvider.family((ref, SpeakerParam arg) {
  return ref
      .watch(speakersRepositoryProvider)
      .getSpeaker(speakerId: arg.id, language: arg.locale.languageCode);
});

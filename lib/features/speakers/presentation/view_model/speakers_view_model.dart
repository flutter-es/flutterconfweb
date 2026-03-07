import 'dart:async';
import 'dart:ui';

import 'package:flutter_conf_latam/features/speakers/data/speakers_repository.dart';
import 'package:flutter_conf_latam/features/speakers/domain/models/speaker_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:signals/signals.dart';

final speakersRandomSignal = futureSignal<List<SpeakerModel>>(() async {
  final localeName = appLocalizations.value.localeName;
  return speakersRepository.value.getSpeakers(
    language: Locale(localeName).languageCode,
    isRandom: true,
  );
});

final speakersSignal = futureSignal<List<SpeakerModel>>(() async {
  final localeName = appLocalizations.value.localeName;
  return speakersRepository.value.getSpeakers(
    language: Locale(localeName).languageCode,
  );
});

final _speakerCache = <String, FutureSignal<SpeakerModel>>{};

FutureSignal<SpeakerModel> getSpeakerSignal(String speakerId) {
  return _speakerCache.putIfAbsent(speakerId, () {
    return futureSignal<SpeakerModel>(() async {
      final localeName = appLocalizations.value.localeName;
      return speakersRepository.value.getSpeaker(
        speakerId: speakerId,
        language: Locale(localeName).languageCode,
      );
    });
  });
}

void reloadSpeakers() {
  unawaited(speakersRandomSignal.reload());
  unawaited(speakersSignal.reload());
  for (final signal in _speakerCache.values) {
    unawaited(signal.reload());
  }
}

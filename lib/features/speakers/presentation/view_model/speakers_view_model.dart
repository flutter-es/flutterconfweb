import 'dart:async';

import 'package:flutter_conf_common/flutter_conf_common.dart';
import 'package:flutter_conf_core/flutter_conf_core.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:signals/signals.dart';

final speakersSignal = futureSignal<List<SpeakerEntity>>(() async {
  final result = await speakerRepository.value.listActiveSpeakers();
  return switch (result) {
    Success(:final data) => data,
    Failure(:final failure) => throw failure,
  };
});

final speakersRandomSignal = futureSignal<List<SpeakerEntity>>(() async {
  final result = await speakerRepository.value.listActiveSpeakers();
  switch (result) {
    case Success(:final data):
      final speakerCompleted = List<SpeakerEntity>.from(data).where((item) {
        return item.presentationImageUrl != null;
      }).toList();

      return (speakerCompleted..shuffle()).take(11).toList();
    case Failure(:final failure):
      throw failure;
  }
});

final _speakerCache = <String, FutureSignal<SpeakerEntity>>{};

FutureSignal<SpeakerEntity> getSpeakerSignal(String speakerId) {
  return _speakerCache.putIfAbsent(speakerId, () {
    return futureSignal<SpeakerEntity>(() async {
      final result = await speakerRepository.value.getSpeakerById(
        id: speakerId,
      );
      return switch (result) {
        Success(:final data) => data,
        Failure(:final failure) => throw failure,
      };
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

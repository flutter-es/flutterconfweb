import 'dart:async';

import 'package:flutter_conf_latam/features/shared/providers/shared_providers.dart';
import 'package:flutter_conf_latam/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final speakersRepositoryProvider = Provider((ref) {
  return SpeakersRepository(ref);
});

class SpeakersRepository {
  SpeakersRepository(this.ref);

  final Ref ref;
  List<SpeakerModel> cachedSpeakers = [];

  Future<List<SpeakerModel>> getSpeakers() {
    final speakersCompleter = Completer<List<SpeakerModel>>();

    if (cachedSpeakers.isNotEmpty) {
      return Future.value(cachedSpeakers);
    }

    final dbInstance = ref.read(dbProvider);
    dbInstance
        .collection('speakers')
        .get()
        .then((snapshot) {
          cachedSpeakers =
              snapshot.docs.map((speakerDoc) {
                return SpeakerModel.fromFirestore(
                  speakerDoc.id,
                  speakerDoc.data(),
                );
              }).toList();

          speakersCompleter.complete(cachedSpeakers);
        })
        .catchError((Object error) {
          speakersCompleter.completeError(error.toString());
        })
        .onError((error, stackTrace) {
          speakersCompleter.completeError(error.toString());
        });

    return speakersCompleter.future;
  }
}

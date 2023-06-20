import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_conf_colombia/features/shared/providers/shared_providers.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final speakersRepositoryProvider = Provider((ref) {
  return SpeakersRepository(ref);
});

class SpeakersRepository {
  SpeakersRepository(this.ref);

  final Ref ref;

  Future<List<SpeakerModel>> getSpeakers() {
    Completer<List<SpeakerModel>> speakersCompleter = Completer();

    final dbInstance = ref.read(dbProvider);
    dbInstance.collection('speakers').get().then((snapshot) {
      List<SpeakerModel> speakers = snapshot.docs.map((speakerDoc) => SpeakerModel.fromFirestore(
      speakerDoc.data() as Map<String, dynamic>)).toList();

      speakersCompleter.complete(speakers);

    }).catchError((error) {
      speakersCompleter.completeError(error.toString());
    }).onError((error, stackTrace) {
      speakersCompleter.completeError(error.toString());
    });
    

    return speakersCompleter.future;
  }
}

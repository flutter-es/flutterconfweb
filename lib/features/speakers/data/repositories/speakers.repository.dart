import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final speakersRepositoryProvider = Provider((ref) {
  return SpeakersRepository(ref);
});

class SpeakersRepository {
  SpeakersRepository(this.ref);

  final Ref ref;

  List<SpeakerModel> getSpeakers() {
    return [];
  }

  // ignore: avoid_field_initializers_in_const_classes
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /*Stream<List<SpeakerModel>> get speakers =>
      _firestore.collection('speakers').snapshots().map(
            (snapshot) =>
                snapshot.docs.map(SpeakerModel.fromFirestore).toList(),
          );*/

  void inti() {}

  Future<List<DocumentSnapshot>> itemsPaginateFuture({
    required int limit,
    DocumentSnapshot? lastDocument,
  }) async {
    Query<Map<String, dynamic>> docRef = _firestore.collection('speakers');

    if (lastDocument != null) {
      docRef = docRef.startAfterDocument(lastDocument);
    }

    return docRef.limit(limit).get().then((value) => value.docs);
  }
}

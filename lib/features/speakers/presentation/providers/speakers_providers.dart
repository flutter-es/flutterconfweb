import 'package:flutter_conf_latam/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_latam/features/speakers/data/repositories/speakers.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final speakersRepositoryProvider = Provider((ref) {
  return SpeakersRepository(ref);
});

final speakersProvider = FutureProvider<List<SpeakerModel>>((ref) {
  return ref.read(speakersRepositoryProvider).getSpeakers();
});

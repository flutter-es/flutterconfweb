import 'package:flutter_conf_colombia/features/speakers/data/repositories/speakers.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final speakersRepositoryProvider = Provider((ref) {
  return SpeakersRepository(ref);
});

final speakersProvider = Provider((ref) {
  return ref.read(speakersRepositoryProvider).getSpeakers();
});

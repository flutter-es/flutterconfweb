import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpeakersRepository {

  const SpeakersRepository(this.ref);

  final Ref ref;

  List<SpeakerModel> getSpeakers() {
    return [];
  }

}
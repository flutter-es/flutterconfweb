import 'package:flutter_conf_colombia/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';

class ScheduleSessionModel {

  const ScheduleSessionModel({
    required this.id,
    required this.slotIndex,
    required this.speakers,
    required this.dateTime,
    required this.duration,
    required this.room,
    required this.session,
  });

  final String id;
  final int slotIndex;
  final List<SpeakerModel> speakers;
  final SessionModel session;
  final DateTime dateTime;
  final Duration duration;
  final String room;
}

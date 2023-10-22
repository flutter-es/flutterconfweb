import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_time_block.model.dart';
import 'package:flutter_conf_colombia/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';

class ScheduleDayModel {

  const ScheduleDayModel({
    required this.dayIndex,
    required this.date,
    required this.sessions,
    required this.speakers,
  });

  final int dayIndex;
  final DateTime date;
  final List<SessionModel> sessions;
  final List<SpeakerModel> speakers;
}

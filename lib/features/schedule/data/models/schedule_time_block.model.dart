import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_session.model.dart';

class ScheduleTimeBlockModel {

  const ScheduleTimeBlockModel({
    required this.time,
    required this.sessions,
  });

  final DateTime time;
  final List<ScheduleSessionModel> sessions;
}

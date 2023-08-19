import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_time_block.model.dart';

class ScheduleDayModel {

  const ScheduleDayModel({
    required this.date,
    required this.sessionTimeBlocks,
  });

  final DateTime date;
  final List<ScheduleTimeBlockModel> sessionTimeBlocks;
}

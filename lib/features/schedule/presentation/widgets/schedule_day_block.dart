import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_day.model.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_time_block.dart';

class ScheduleDayBlock extends StatelessWidget {

  final ScheduleDayModel scheduleDay;

  const ScheduleDayBlock({
    required this.scheduleDay,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(var scheduleTimeBlock in scheduleDay.sessionTimeBlocks)
          ScheduleTimeBlock(
            timeBlock: scheduleTimeBlock,
          ),
      ],
    );
  }
}

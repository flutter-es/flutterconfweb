import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_time_block.model.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_session.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_time_block_time_label.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';

class ScheduleTimeBlock extends StatelessWidget {

  const ScheduleTimeBlock({
    required this.timeBlock,
    super.key,
  });

  final ScheduleTimeBlockModel timeBlock;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FlutterConfLatamStyles.mediumPadding,
      child: Container(
        padding: FlutterConfLatamStyles.largeMargin.copyWith(
          left: 0, right: 0,
        ),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(
            color: FlutterLatamColors.lightBlue, width: 5,),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ScheduleTimeBlockTimeLabel(
                time: timeBlock.time,
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  for(final session in timeBlock.sessions)
                    ScheduleSession(
                      sessionInfo: session,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
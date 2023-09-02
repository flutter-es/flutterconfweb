import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_time_block.model.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/responsiveness/schedule_content_responsive_config.dart';
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

    final uiConfig = ScheduleContentResponsiveConfig.getSchedulePageResponsiveConfig(context);
    
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
        child: Flex(
          direction: uiConfig.timeContentOrientation,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: uiConfig.timeFlexValue,
              child: ScheduleTimeBlockTimeLabel(
                time: timeBlock.time,
              ),
            ),
            Expanded(
              flex: uiConfig.contentFlexValue,
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
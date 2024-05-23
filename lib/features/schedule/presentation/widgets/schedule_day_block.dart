import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_day.model.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/responsiveness/schedule_day1_layout_lg.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/responsiveness/schedule_day1_mobiletablet.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/responsiveness/schedule_day2_layout_lg.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/responsiveness/schedule_day2_mobiletablet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Tile extends StatelessWidget {
  const Tile({required this.index, super.key});

  final String index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(index),
    );
  }
}

class ScheduleDayBlock extends ConsumerWidget {
  const ScheduleDayBlock({
    required this.scheduleDay,
    super.key,
  });

  final ScheduleDayModel scheduleDay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = getValueForScreenType(
      context: context,
      mobile: true,
      tablet: true,
      desktop: false,
    );

    Widget returningWidget;

    if (scheduleDay.dayIndex == 1) {
      returningWidget = isMobile
          ? ScheduleDay1MobileTabletLayout(
              speakers: scheduleDay.speakers,
              sessions: scheduleDay.sessions,
            )
          : ScheduleDay1LargeLayout(
              speakers: scheduleDay.speakers,
              sessions: scheduleDay.sessions,
            );
    } else {
      returningWidget = isMobile
          ? ScheduleDay2MobileTabletLayout(
              speakers: scheduleDay.speakers,
              sessions: scheduleDay.sessions,
            )
          : ScheduleDay2LargeLayout(
              speakers: scheduleDay.speakers,
              sessions: scheduleDay.sessions,
            );
    }

    return returningWidget;
  }
}

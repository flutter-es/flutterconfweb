import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_day.model.dart';
import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_session.model.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/responsiveness/schedule_day1_layout_lg.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_session.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_time_block.dart';
import 'package:flutter_conf_colombia/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_colombia/features/sessions/presentation/providers/sessions_provider.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/providers/speakers_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Tile extends StatelessWidget {

  final String index;
  const Tile({
    required this.index,
    super.key});

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


    return ScheduleDay1LargeLayout(
      speakers: scheduleDay.speakers,
      sessions: scheduleDay.sessions,
    );
  }
}

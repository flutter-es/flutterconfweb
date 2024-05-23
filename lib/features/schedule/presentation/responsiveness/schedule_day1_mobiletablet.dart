import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/providers/schedule_providers.dart';
import 'package:flutter_conf_colombia/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleDay1MobileTabletLayout extends ConsumerWidget {
  ScheduleDay1MobileTabletLayout(
      {required this.speakers, required this.sessions, super.key});

  List<SessionModel> sessions;
  List<SpeakerModel> speakers;

  Widget getSessionFromSlotId(String id, WidgetRef ref) {
    return ref.read(scheduleSlotProvider(id));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: FlutterConfLatamStyles.mediumSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Utils.getTimeLabelHeader('7:00 - 9:00 AM',
              alignment: MainAxisAlignment.start),
          getSessionFromSlotId('1-1', ref),
          Utils.getTimeLabelHeader('9:00 AM - 10:00 AM',
              alignment: MainAxisAlignment.start),
          getSessionFromSlotId('1-2', ref),
          Utils.getTimeLabelHeader('10:00 - 10:40 AM',
              alignment: MainAxisAlignment.start),
          getSessionFromSlotId('1-3', ref),
          getSessionFromSlotId('1-4', ref),
          getSessionFromSlotId('1-5', ref),
          Utils.getTimeLabelHeader('10:40 - 11:00 AM',
              alignment: MainAxisAlignment.start),
          getSessionFromSlotId('1-6', ref),
          Utils.getTimeLabelHeader('11:00 - 11:40 AM',
              alignment: MainAxisAlignment.start),
          getSessionFromSlotId('1-7', ref),
          getSessionFromSlotId('1-8', ref),
          Utils.getTimeLabelHeader('11:40 - 12:00 PM',
              alignment: MainAxisAlignment.start),
          getSessionFromSlotId('1-10', ref),
          getSessionFromSlotId('1-11', ref),
          getSessionFromSlotId('1-12', ref),
          Utils.getTimeLabelHeader('12:00 - 12:40 PM',
              alignment: MainAxisAlignment.start),
          getSessionFromSlotId('1-13', ref),
          getSessionFromSlotId('1-14', ref),
          Utils.getTimeLabelHeader('12:40 - 14:00 PM',
              alignment: MainAxisAlignment.start),
          getSessionFromSlotId('1-15', ref),
          Utils.getTimeLabelHeader('14:00 - 14:20 PM',
              alignment: MainAxisAlignment.start),
          getSessionFromSlotId('1-16', ref),
          getSessionFromSlotId('1-17', ref),
          getSessionFromSlotId('1-18', ref),
          Utils.getTimeLabelHeader('14:20 - 15:00 PM',
              alignment: MainAxisAlignment.start),
          getSessionFromSlotId('1-19', ref),
          getSessionFromSlotId('1-20', ref),
          Utils.getTimeLabelHeader('15:00 - 15:20 PM',
              alignment: MainAxisAlignment.start),
          getSessionFromSlotId('1-21', ref),
          getSessionFromSlotId('1-22', ref),
          Utils.getTimeLabelHeader('15:20 - 16:00 PM',
              alignment: MainAxisAlignment.start),
          getSessionFromSlotId('1-23', ref),
          getSessionFromSlotId('1-24', ref),
          Utils.getTimeLabelHeader('16:00 - 16:20 PM',
              alignment: MainAxisAlignment.start),
          getSessionFromSlotId('1-25', ref),
          Utils.getTimeLabelHeader('16:20 - 17:00 PM',
              alignment: MainAxisAlignment.start),
          getSessionFromSlotId('1-27', ref),
          getSessionFromSlotId('1-28', ref),
          getSessionFromSlotId('1-29', ref),
          Utils.getTimeLabelHeader('17:00 - 17:20 PM',
              alignment: MainAxisAlignment.start),
          getSessionFromSlotId('1-30', ref),
          Utils.getTimeLabelHeader('17:20 - 18:00 PM',
              alignment: MainAxisAlignment.start),
          getSessionFromSlotId('1-31', ref),
          getSessionFromSlotId('1-32', ref),
          Utils.getTimeLabelHeader('18:00 - 18:20 PM',
              alignment: MainAxisAlignment.start),
          getSessionFromSlotId('1-34', ref),
        ],
      ),
    );
  }
}

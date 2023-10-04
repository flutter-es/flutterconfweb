import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/providers/schedule_providers.dart';
import 'package:flutter_conf_colombia/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleDay2MobileTabletLayout extends ConsumerWidget {
  
  List<SessionModel> sessions;
  List<SpeakerModel> speakers;

  ScheduleDay2MobileTabletLayout({
    required this.speakers,
    required this.sessions,
    super.key
  });

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
          Utils.getTimeLabelHeader('7:30 - 8:00 AM', alignment: MainAxisAlignment.start),
          getSessionFromSlotId('2-1', ref),
    
          Utils.getTimeLabelHeader('9:00 AM - 10:00 AM', alignment: MainAxisAlignment.start),
          getSessionFromSlotId('2-2', ref),
    
          Utils.getTimeLabelHeader('10:00 - 10:40 AM', alignment: MainAxisAlignment.start),
          getSessionFromSlotId('2-3', ref),
          getSessionFromSlotId('2-4', ref),
          getSessionFromSlotId('2-5', ref),
    
          Utils.getTimeLabelHeader('10:40 - 11:00 AM', alignment: MainAxisAlignment.start),
          getSessionFromSlotId('2-6', ref),
    
          Utils.getTimeLabelHeader('11:00 - 11:40 AM', alignment: MainAxisAlignment.start),
          getSessionFromSlotId('2-7', ref),
          getSessionFromSlotId('2-8', ref),
    
          Utils.getTimeLabelHeader('11:40 - 12:00 PM', alignment: MainAxisAlignment.start),
          getSessionFromSlotId('2-10', ref),
          getSessionFromSlotId('2-11', ref),
          getSessionFromSlotId('2-12', ref),
    
          Utils.getTimeLabelHeader('12:00 - 12:40 PM', alignment: MainAxisAlignment.start),
          getSessionFromSlotId('2-13', ref),
          getSessionFromSlotId('2-14', ref),
    
          Utils.getTimeLabelHeader('12:40 - 14:00 PM', alignment: MainAxisAlignment.start),
          getSessionFromSlotId('2-15', ref),
    
          Utils.getTimeLabelHeader('14:00 - 14:20 PM', alignment: MainAxisAlignment.start),
          getSessionFromSlotId('2-16', ref),
          getSessionFromSlotId('2-17', ref),
    
          Utils.getTimeLabelHeader('14:20 - 15:00 PM', alignment: MainAxisAlignment.start),
          getSessionFromSlotId('2-19', ref),
          getSessionFromSlotId('2-20', ref),
          getSessionFromSlotId('2-21', ref),
    
    
          Utils.getTimeLabelHeader('15:00 - 15:20 PM', alignment: MainAxisAlignment.start),
          getSessionFromSlotId('2-22', ref),
    
          Utils.getTimeLabelHeader('15:20 - 16:00 PM', alignment: MainAxisAlignment.start),
          getSessionFromSlotId('2-23', ref),
          getSessionFromSlotId('2-24', ref),
          getSessionFromSlotId('2-25', ref),
    
          Utils.getTimeLabelHeader('16:00 - 16:20 PM', alignment: MainAxisAlignment.start),
          getSessionFromSlotId('2-26', ref),
          getSessionFromSlotId('2-27', ref),
    
          Utils.getTimeLabelHeader('16:20 - 17:00 PM', alignment: MainAxisAlignment.start),
          getSessionFromSlotId('2-28', ref),
          getSessionFromSlotId('2-29', ref),
    
          Utils.getTimeLabelHeader('17:00 - 17:40 PM', alignment: MainAxisAlignment.start),
          getSessionFromSlotId('2-30', ref),
          getSessionFromSlotId('2-31', ref),
    
          Utils.getTimeLabelHeader('17:40 - 18:00 PM', alignment: MainAxisAlignment.start),
          getSessionFromSlotId('2-33', ref),
        ]
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_cell_content.dart';
import 'package:flutter_conf_colombia/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';

class ScheduleDay1MobileTabletLayout extends StatelessWidget {

  List<SessionModel> sessions;
  List<SpeakerModel> speakers;

  ScheduleDay1MobileTabletLayout({
    required this.speakers,
    required this.sessions,
    super.key
  });

  Widget getSessionFromSlotId(String id) {

    if (sessions.any((s) => s.scheduleSlot == id)) {
      final foundSession = sessions.firstWhere((s) => s.scheduleSlot == id);
      final speakersList = speakers.where((s) => foundSession.speakers.contains(s.id)).toList();

      return ScheduleCellContent(
        session: foundSession, 
        speakers: speakersList
      );
    }
                        
   return Container(
    color: Colors.grey.withOpacity(0.125),
   );
  }

  Widget getTimeLabelHeader(String label) {
    const timeLabelStyle = TextStyle(color: FlutterLatamColors.darkBlue, fontSize: FlutterConfLatamStyles.mediumSize, fontWeight: FontWeight.bold);

    return Container(
      margin: const EdgeInsets.only(bottom: FlutterConfLatamStyles.smallSize),
      child: Text(label, style: timeLabelStyle),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(top: FlutterConfLatamStyles.mediumSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          getTimeLabelHeader('7:30-8:00 AM'),
          getSessionFromSlotId('1-1'),
    
          getTimeLabelHeader('9:00 AM / 10:00 AM'),
          getSessionFromSlotId('1-2'),
    
          getTimeLabelHeader('10:00 / 10:40 AM'),
          getSessionFromSlotId('1-3'),
          getSessionFromSlotId('1-4'),
          getSessionFromSlotId('1-5'),
    
          getTimeLabelHeader('10:40 / 11:00 AM'),
          getSessionFromSlotId('1-6'),
    
          getTimeLabelHeader('11:00 / 11:40 AM'),
          getSessionFromSlotId('1-7'),
          getSessionFromSlotId('1-8'),
    
          getTimeLabelHeader('11:40 / 12:00 AM'),
          getSessionFromSlotId('1-10'),
          getSessionFromSlotId('1-11'),
          getSessionFromSlotId('1-12'),
    
          getTimeLabelHeader('12:00 / 12:40 AM'),
          getSessionFromSlotId('1-13'),
          getSessionFromSlotId('1-14'),
    
          getTimeLabelHeader('12:40 / 14:00 AM'),
          getSessionFromSlotId('1-15'),
    
          getTimeLabelHeader('14:00 / 14:20 PM'),
          getSessionFromSlotId('1-16'),
          getSessionFromSlotId('1-17'),
          getSessionFromSlotId('1-18'),
    
          getTimeLabelHeader('14:20 / 15:00 PM'),
          getSessionFromSlotId('1-19'),
          getSessionFromSlotId('1-20'),
    
          getTimeLabelHeader('15:00 / 15:20 PM'),
          getSessionFromSlotId('1-21'),
          getSessionFromSlotId('1-22'),
    
          getTimeLabelHeader('15:20 / 16:00 PM'),
          getSessionFromSlotId('1-23'),
          getSessionFromSlotId('1-24'),
    
          getTimeLabelHeader('16:00 / 16:20 PM'),
          getSessionFromSlotId('1-25'),
    
          getTimeLabelHeader('16:20 / 17:00 PM'),
          getSessionFromSlotId('1-27'),
          getSessionFromSlotId('1-28'),
          getSessionFromSlotId('1-29'),
    
          getTimeLabelHeader('17:00 / 17:20 PM'),
          getSessionFromSlotId('1-30'),
    
          getTimeLabelHeader('17:20-18:00 PM'),
          getSessionFromSlotId('1-31'),
          getSessionFromSlotId('1-32'),
    
          getTimeLabelHeader('18:00 / 18:20 PM'),
          getSessionFromSlotId('1-34'),
        ]
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_cell_content.dart';
import 'package:flutter_conf_colombia/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';

class ScheduleDay2MobileTabletLayout extends StatelessWidget {
  
  List<SessionModel> sessions;
  List<SpeakerModel> speakers;

  ScheduleDay2MobileTabletLayout({
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
          getSessionFromSlotId('2-1'),
    
          getTimeLabelHeader('9:00 AM / 10:00 AM'),
          getSessionFromSlotId('2-2'),
    
          getTimeLabelHeader('10:00 / 10:40 AM'),
          getSessionFromSlotId('2-3'),
          getSessionFromSlotId('2-4'),
          getSessionFromSlotId('2-5'),
    
          getTimeLabelHeader('10:40 / 11:00 AM'),
          getSessionFromSlotId('2-6'),
    
          getTimeLabelHeader('11:00 / 11:40 AM'),
          getSessionFromSlotId('2-7'),
          getSessionFromSlotId('2-8'),
    
          getTimeLabelHeader('11:40 / 12:00 AM'),
          getSessionFromSlotId('2-10'),
          getSessionFromSlotId('2-11'),
          getSessionFromSlotId('2-12'),
    
          getTimeLabelHeader('12:00 / 12:40 AM'),
          getSessionFromSlotId('2-13'),
          getSessionFromSlotId('2-14'),
    
          getTimeLabelHeader('12:40 / 14:00 AM'),
          getSessionFromSlotId('2-15'),
    
          getTimeLabelHeader('14:00 / 14:20 PM'),
          getSessionFromSlotId('2-16'),
          getSessionFromSlotId('2-17'),
    
          getTimeLabelHeader('14:20 / 15:00 PM'),
          getSessionFromSlotId('2-19'),
          getSessionFromSlotId('2-20'),
          getSessionFromSlotId('2-21'),
    
    
          getTimeLabelHeader('15:00 / 15:20 PM'),
          getSessionFromSlotId('2-22'),
    
          getTimeLabelHeader('15:20 / 16:00 PM'),
          getSessionFromSlotId('2-23'),
          getSessionFromSlotId('2-24'),
          getSessionFromSlotId('2-25'),
    
          getTimeLabelHeader('16:00 / 16:20 PM'),
          getSessionFromSlotId('2-26'),
          getSessionFromSlotId('2-27'),
    
          getTimeLabelHeader('16:20 / 17:00 PM'),
          getSessionFromSlotId('2-28'),
          getSessionFromSlotId('2-29'),
    
          getTimeLabelHeader('17:00 / 17:40 PM'),
          getSessionFromSlotId('2-30'),
          getSessionFromSlotId('2-31'),
    
          getTimeLabelHeader('17:40 / 18:00 PM'),
          getSessionFromSlotId('2-33'),
        ]
      ),
    );
  }
}
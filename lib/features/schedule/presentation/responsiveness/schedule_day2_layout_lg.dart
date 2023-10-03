import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/responsiveness/schedule_content_responsive_config.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_cell_content.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_session.dart';
import 'package:flutter_conf_colombia/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ScheduleDay2LargeLayout extends StatelessWidget {

  List<SessionModel> sessions;
  List<SpeakerModel> speakers;

  ScheduleDay2LargeLayout({
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
    //child: Text('$id'),
   );
  }

  @override
  Widget build(BuildContext context) {

    final uiConfig = ScheduleContentResponsiveConfig.getSchedulePageResponsiveConfig(context);
    
    return StaggeredGrid.count(
      axisDirection: AxisDirection.down,
        crossAxisCount: 7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: [
          const StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: SizedBox.shrink(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: uiConfig.trackTabPadding,
                  color: Colors.orangeAccent,
                  child: Text('Track 1', style: uiConfig.trackLabelStyle.copyWith(color: Colors.black), textAlign: TextAlign.center,),
                )
              ],
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: uiConfig.trackTabPadding,
                  color: Colors.orangeAccent,
                  child: Text('Track 2', style: uiConfig.trackLabelStyle.copyWith(color: Colors.black), textAlign: TextAlign.center,),
                )
              ],
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: uiConfig.trackTabPadding,
                  color: Colors.greenAccent,
                  child: Text('Workshops', style: uiConfig.trackLabelStyle.copyWith(color: Colors.black), textAlign: TextAlign.center,),
                )
              ],
            ),
          ),
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('7:30-8:00 AM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 6,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-1'),
          ),
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('9:00 AM / 10:00 AM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 6,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-2'),
          ),
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('10:00 / 10:40 AM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-3'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-4'),
          ),
    
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: getSessionFromSlotId('2-5'),
          ),
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('10:40 / 11:00 AM'),
          ),
    
          StaggeredGridTile.count(
            crossAxisCellCount: 4,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-6'),
          ),
          
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('11:00 / 11:40 AM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-7'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-8'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-9'),
          ),
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('11:40 / 12:00 PM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-10'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-11'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: getSessionFromSlotId('2-12'),
          ),
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('12:40 / 12:40 AM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-13'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-14'),
          ),
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('12:40 / 14:00 AM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 6,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-15'),
          ),
          
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('14:00 / 14:20 AM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-16'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-17'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-18'),
          ),
          
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('14:20 / 15:00 PM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-19'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-20'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: getSessionFromSlotId('2-21'),
          ),
          
          
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('15:00 / 15:20 PM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 4,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-22'),
          ),
          
          
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('15:20 / 16:00 PM'),
          ),

          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-23'),
          ),

          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-24'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-25'),
          ),
          
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('16:00 / 16:20 PM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 4,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-26'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: getSessionFromSlotId('2-27'),
          ),
          
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('16:20 / 17:00 PM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-28'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-29'),
          ),
          
          
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('17:00 / 17:40 PM'),
          ),

          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-30'),
          ),

          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-31'),
          ),

           StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-32'),
          ),
          
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('17:40 / 18:00 PM'),
          ),
         
          StaggeredGridTile.count(
            crossAxisCellCount: 6,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId('2-33'),
          ),
          
        ],
      );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/responsiveness/schedule_content_responsive_config.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_cell_content.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_session.dart';
import 'package:flutter_conf_colombia/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ScheduleDay1LargeLayout extends StatelessWidget {

  List<SessionModel> sessions;
  List<SpeakerModel> speakers;

  ScheduleDay1LargeLayout({
    required this.speakers,
    required this.sessions,
    super.key
  });

  Widget getSessionFromSlotId(int id) {

    if (sessions.any((s) => s.scheduleSlot == id)) {
      final foundSession = sessions.firstWhere((s) => s.scheduleSlot == id);
      final speakersList = speakers.where((s) => foundSession.speakers.contains(s.id)).toList();

      return ScheduleCellContent(
        session: foundSession, 
        speakers: speakersList
      );
    }
                        
   return Container(
    color: Colors.grey.withOpacity(0.125)
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
            child: Text('7:30-8:00AM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 6,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(1),
          ),
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('9:00 AM / 10:00 AM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 6,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(2),
          ),
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('10:00 / 10:40 AM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(32),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(3),
          ),
    
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: getSessionFromSlotId(5),
          ),
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('10:40 / 11:00 AM'),
          ),
    
          StaggeredGridTile.count(
            crossAxisCellCount: 4,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(4),
          ),
          
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('11:00 / 11:40 AM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(6),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(7),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(31),
          ),
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('11:40 / 12:00 PM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(8),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(9),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: getSessionFromSlotId(11),
          ),
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('12:40 / 12:40 AM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(30),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(10),
          ),
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('12:40 / 14:00 AM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 6,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(12),
          ),
          
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('14:00 / 14:20 AM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(13),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(14),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(29),
          ),
          
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('14:20 / 15:00 PM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(15),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(16),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(28),
          ),
          
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('15:00 / 15:20 PM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 6,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(17),
          ),
          
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('15:20 / 16:00 PM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(18),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(19),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: getSessionFromSlotId(27),
          ),
          
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('16:00 / 16:20 PM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 4,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(20),
          ),
          
    
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('16:20 / 17:00 PM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(26),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(33),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: getSessionFromSlotId(25),
          ),
          
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('17:00 / 17:20 PM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 4,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(21),
          ),
          
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('17:20 / 18:00 PM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(22),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(23),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(34),
          ),
          
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Text('18:00 / 18:20 PM'),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 6,
            mainAxisCellCount: 1,
            child: getSessionFromSlotId(24),
          ),
        ],
      );
  }
}

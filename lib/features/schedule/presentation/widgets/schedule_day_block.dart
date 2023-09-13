import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_day.model.dart';
import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_session.model.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_session.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_time_block.dart';
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

class ScheduleDayBlock extends StatelessWidget {

  const ScheduleDayBlock({
    required this.scheduleDay,
    super.key,
  });

  final ScheduleDayModel scheduleDay;

  ScheduleSessionModel? getSessionFromSlotId(List<ScheduleSessionModel> sessions, int id) {

     if (sessions.any((ScheduleSessionModel s) => s.slotIndex == 1)) {
      return sessions.firstWhere((s) => s.slotIndex == id);
     }

     return null;
  }

  @override
  Widget build(BuildContext context) {

    List<ScheduleSessionModel> allSessions = [];
    scheduleDay.sessionTimeBlocks.forEach((timeBlock) {
      timeBlock.sessions.forEach((session) {
        allSessions.add(session);
      });
    });

    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: StaggeredGrid.count(
            axisDirection: AxisDirection.down,
              crossAxisCount: 7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: SizedBox.shrink(),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Container(child: Text('TRACK 1')),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Container(child: Text('TRACK 2')),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Container(child: Text('WORKSHOPS')),
                ),


                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child:  Container(child: Text('TRACK 1')), // Tile(index: '7:30-8:00AM'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 6,
                  mainAxisCellCount: 1,
                  child:  Container(child: Text('Registration / Check-in')), //Tile(index: 'Registration / check-in'),
                ),

                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child:  Container(child: Text('TRACK 1')),// Tile(index: '9:00 AM / 10:00 AM'),
                ),
                
                // slot #1
                StaggeredGridTile.count(
                  crossAxisCellCount: 6,
                  mainAxisCellCount: 1,
                  child: getSessionFromSlotId(allSessions, 1) != null ? 
                  ScheduleSession(
                    sessionInfo: getSessionFromSlotId(allSessions, 1)!,
                  ) : SizedBox.shrink()// Tile(index: 'Panel / Keynote: Jorge Coca'),
                ),

                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Tile(index: '10:00 / 10:40 AM'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: '<EMPTY>'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: getSessionFromSlotId(allSessions, 1) != null ? 
                  ScheduleSession(
                    sessionInfo: getSessionFromSlotId(allSessions, 1)!,
                  ) : SizedBox.shrink()// Ti
                ),

                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: Tile(index: 'W1: Pooja'),
                ),

                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Tile(index: '10:40 / 11:00 AM'),
                ),

                StaggeredGridTile.count(
                  crossAxisCellCount: 4,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'coffee break'),
                ),
                
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Tile(index: '11:00 / 11:40 AM'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'Oscar Martin'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'Majid'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: '<EMPTY>'),
                ),

                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Tile(index: '11:40 / 12:00 PM'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'Darwin Morocho'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'Juan Campuzano'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: Tile(index: 'W2: Frank Moreno'),
                ),

                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Tile(index: '12:40 / 12:40 AM'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: '<EMPTY>'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'Renan'),
                ),

                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Tile(index: '12:40 / 14:00 AM'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 6,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'LUNCH'),
                ),
                

                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Tile(index: '14:00 / 14:20 AM'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'Alejandro'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'Santiago'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: '<EMPTY>'),
                ),
                
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Tile(index: '14:20 / 15:00 PM'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'Liber Da Silva'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'Lucas Josefiak'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: '<EMPTY>'),
                ),
                

                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Tile(index: '15:00 / 15:20 PM'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 6,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'BREAK'),
                ),
                
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Tile(index: '15:20 / 16:00 PM'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'Diego'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'Hansy'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: Tile(index: 'W3: Matias Irland'),
                ),
                
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Tile(index: '16:00 / 16:20 PM'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 4,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'BREAK'),
                ),
                

                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Tile(index: '16:20 / 17:00 PM'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'Gianfranco'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: '<EMPTY>'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: Tile(index: 'W3: Matias Irland'),
                ),
                
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Tile(index: '17:00 / 17:20 PM'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 4,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'BREAK'),
                ),
                
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Tile(index: '17:20 / 18:00 PM'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'Marines'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'David Rios'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1,
                  child: Tile(index: '<EMPTY>'),
                ),
                
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Tile(index: '18:00 / 18:20 PM'),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 6,
                  mainAxisCellCount: 1,
                  child: Tile(index: 'DINNER'),
                ),
              ],
            ),
        ),
      ),
    );
    // return Column(
    //   children: [
    //     for(var scheduleTimeBlock in scheduleDay.sessionTimeBlocks)
    //       ScheduleTimeBlock(
    //         timeBlock: scheduleTimeBlock,
    //       ),
    //   ],
    // );
  }
}

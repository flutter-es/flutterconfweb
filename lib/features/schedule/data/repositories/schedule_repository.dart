import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_day.model.dart';
import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_session.model.dart';
import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_time_block.model.dart';
import 'package:flutter_conf_colombia/features/schedule/data/models/session.model.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_time_block.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';

class ScheduleRepository {

  Future<List<ScheduleDayModel>> getEventSchedule() {

    return Future.value([
      ScheduleDayModel(
        date: DateTime.parse('2023-10-25T00:00:00Z'),
        sessionTimeBlocks: [
          ScheduleTimeBlockModel(
            time: DateTime.parse('2023-10-25T10:00:00Z'),
            sessions: [
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'John Smith',
                    photo: 'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg',
                  ),
                  SpeakerModel(
                    name: 'Paola Lazaro',
                    photo: 'https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-08-18T15:42:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 1233', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              ),
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Jane Smith',
                    photo: 'https://images.pexels.com/photos/4926674/pexels-photo-4926674.jpeg',
                  ),
                  SpeakerModel(
                    name: 'Rosita Perez',
                    photo: 'https://images.pexels.com/photos/1808777/pexels-photo-1808777.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-25T10:00:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 124', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              ),
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Maria Jackson',
                    photo: 'https://images.pexels.com/photos/6497114/pexels-photo-6497114.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-25T10:00:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 125', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              )
            ],
          ),
          ScheduleTimeBlockModel(
            time: DateTime.parse('2023-10-25T10:30:00Z'),
            sessions: [
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Michael Bison',
                    photo: 'https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-25T10:30:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 123', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              ),
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Luisa Marie',
                    photo: 'https://images.pexels.com/photos/712513/pexels-photo-712513.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-25T10:30:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 124', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              ),
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Carl Rose',
                    photo: 'https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-25T10:30:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 125', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              )
            ],
          ),
          ScheduleTimeBlockModel(
            time: DateTime.parse('2023-10-25T11:00:00Z'),
            sessions: [
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Paola Lazaro',
                    photo: 'https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-25T11:00:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 123', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              ),
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Jennifer Aninston',
                    photo: 'https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-25T11:00:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 124', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              ),
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Peter Blake',
                    photo: 'https://images.pexels.com/photos/3004884/pexels-photo-3004884.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-25T11:00:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 125', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              )
            ],
          ),
          ScheduleTimeBlockModel(
            time: DateTime.parse('2023-10-25T11:30:00Z'),
            sessions: [
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Peter Blake',
                    photo: 'https://images.pexels.com/photos/3004884/pexels-photo-3004884.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-25T11:30:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 123', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              ),
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Paola Lazaro',
                    photo: 'https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-25T11:30:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 124', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              ),
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Peter Blake',
                    photo: 'https://images.pexels.com/photos/3004884/pexels-photo-3004884.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-25T11:30:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 125', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              )
            ],
          ),
        ],
      ),
      ScheduleDayModel(
        date: DateTime.parse('2023-10-26T00:00:00Z'),
        sessionTimeBlocks: [
          ScheduleTimeBlockModel(
            time: DateTime.parse('2023-10-26T10:00:00Z'),
            sessions: [
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'John Smith',
                    photo: 'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg',
                  ),
                  SpeakerModel(
                    name: 'Julie DeMoines',
                    photo: 'https://images.pexels.com/photos/773371/pexels-photo-773371.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-26T10:00:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 123', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              ),
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Jane Smith',
                    photo: 'https://images.pexels.com/photos/4926674/pexels-photo-4926674.jpeg',
                  ),
                  SpeakerModel(
                    name: 'Rosita Perez',
                    photo: 'https://images.pexels.com/photos/1808777/pexels-photo-1808777.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-26T10:00:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 124', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              ),
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Maria Jackson',
                    photo: 'https://images.pexels.com/photos/6497114/pexels-photo-6497114.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-26T10:00:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 125', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              )
            ],
          ),
          ScheduleTimeBlockModel(
            time: DateTime.parse('2023-10-26T10:30:00Z'),
            sessions: [
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Michael Bison',
                    photo: 'https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-26T10:30:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 123', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              ),
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Luisa Marie',
                    photo: 'https://images.pexels.com/photos/712513/pexels-photo-712513.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-26T10:30:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 124', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              ),
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Carl Rose',
                    photo: 'https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-26T10:30:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 125', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              )
            ],
          ),
          ScheduleTimeBlockModel(
            time: DateTime.parse('2023-10-26T11:00:00Z'),
            sessions: [
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Paola Lazaro',
                    photo: 'https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-26T11:00:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 123', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              ),
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Jennifer Aninston',
                    photo: 'https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-26T11:00:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 124', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              ),
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Peter Blake',
                    photo: 'https://images.pexels.com/photos/3004884/pexels-photo-3004884.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-26T11:00:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 125', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              )
            ],
          ),
          ScheduleTimeBlockModel(
            time: DateTime.parse('2023-10-26T11:30:00Z'),
            sessions: [
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Peter Blake',
                    photo: 'https://images.pexels.com/photos/3004884/pexels-photo-3004884.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-26T11:30:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 123', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              ),
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Raj Kutrapali',
                    photo: 'https://images.pexels.com/photos/1516680/pexels-photo-1516680.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-26T11:30:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 124', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              ),
              ScheduleSessionModel(
                id: '', 
                speakers: [
                  SpeakerModel(
                    name: 'Peter Blake',
                    photo: 'https://images.pexels.com/photos/3004884/pexels-photo-3004884.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ], 
                dateTime: DateTime.parse('2023-10-26T11:30:00Z'),
                duration: const Duration(minutes: 60), 
                room: 'Room 125', 
                session: SessionModel(
                  title: 'Building Some Stuff in there for Flutter Web',
                ),
              )
            ],
          ),
        ],
      ),
    ]);
  }
}

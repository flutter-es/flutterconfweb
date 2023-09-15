import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_day.model.dart';
import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_session.model.dart';
import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_time_block.model.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_time_block.dart';
import 'package:flutter_conf_colombia/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_colombia/features/sessions/presentation/providers/sessions_provider.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/providers/speakers_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleRepository {

  final Ref ref;
  ScheduleRepository(this.ref);

  Future<List<ScheduleDayModel>> getEventSchedule() async {

    final speakers = await ref.watch(speakersProvider.future);
    final sessions = await ref.watch(sessionsProvider.future);

    return [
      ScheduleDayModel(
        date: DateTime.parse('2023-10-25T00:00:00Z'),
        sessions: sessions,
        speakers:  speakers,
      ),
      ScheduleDayModel(
        date: DateTime.parse('2023-10-26T00:00:00Z'),
        sessions: sessions,
        speakers: speakers,
      ),
    ];
  }
}

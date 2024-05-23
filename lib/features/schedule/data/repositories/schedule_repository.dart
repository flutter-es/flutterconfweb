import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_day.model.dart';
import 'package:flutter_conf_colombia/features/sessions/presentation/providers/sessions_provider.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/providers/speakers_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleRepository {
  ScheduleRepository(this.ref);

  final Ref ref;

  Future<List<ScheduleDayModel>> getEventSchedule() async {
    final speakers = await ref.watch(speakersProvider.future);
    final sessions = await ref.watch(sessionsProvider.future);

    return [
      ScheduleDayModel(
        dayIndex: 1,
        date: DateTime.parse('2023-10-25T00:00:00Z'),
        sessions: sessions
            .where((s) =>
                s.scheduleSlot.isNotEmpty && s.scheduleSlot.startsWith('1'))
            .toList(),
        speakers: speakers,
      ),
      ScheduleDayModel(
        dayIndex: 2,
        date: DateTime.parse('2023-10-26T00:00:00Z'),
        sessions: sessions
            .where((s) =>
                s.scheduleSlot.isNotEmpty && s.scheduleSlot.startsWith('2'))
            .toList(),
        speakers: speakers,
      ),
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/features/schedule/data/models/schedule_day.model.dart';
import 'package:flutter_conf_latam/features/schedule/data/repositories/schedule_repository.dart';
import 'package:flutter_conf_latam/features/schedule/presentation/widgets/schedule_cell_content.dart';
import 'package:flutter_conf_latam/features/sessions/presentation/providers/sessions_provider.dart';
import 'package:flutter_conf_latam/features/sessions/presentation/widgets/schedule_session_container.dart';
import 'package:flutter_conf_latam/features/speakers/presentation/providers/speakers_providers.dart';
import 'package:flutter_conf_latam/helpers/utils.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

final scheduleRepositoryProvider = Provider((ref) {
  return ScheduleRepository(ref);
});

final scheduleFutureProvider = FutureProvider<List<ScheduleDayModel>>((ref) {
  return ref.read(scheduleRepositoryProvider).getEventSchedule();
});

final scheduleDaySelectionProvider = StateProvider<DateTime?>((ref) => null);

final timeFormatterProvider = Provider.family((ref, DateTime time) {
  final loc = tz.getLocation('America/Bogota');
  final date = tz.TZDateTime(
    loc,
    time.year,
    time.month,
    time.day,
    time.hour,
    time.minute,
    time.second,
  );
  final formatter = DateFormat('h:mm a', 'es_CO');
  final formatted = formatter.format(date);
  return formatted;
});

final shortDateFormatterProvider = Provider.family((ref, DateTime time) {
  final appLoc = ref.watch(appLocalizationsProvider);
  final loc = tz.getLocation('America/Bogota');
  final date = tz.TZDateTime(
    loc,
    time.year,
    time.month,
    time.day,
    time.hour,
    time.minute,
    time.second,
  );
  final formatter = DateFormat('EEE, MMM d', appLoc.localeName);
  final formatted = formatter.format(date);
  return formatted;
});

final currentEventLocationTimeProvider = Provider.family((
  ref,
  DateTime sessionTime,
) {
  final detroit = tz.getLocation('America/Bogota');
  final now = tz.TZDateTime.now(detroit);
  return now.minute > sessionTime.minute;
});

final scheduleSlotProvider = Provider.family((ref, String id) {
  final speakers = ref.read(speakersProvider).value;
  final sessions = ref.read(sessionsProvider).value;

  if (sessions!.any((s) => s.scheduleSlot == id)) {
    final foundSession = sessions.firstWhere((s) => s.scheduleSlot == id);
    final speakersList =
        speakers!.where((s) => foundSession.speakers.contains(s.id)).toList();

    return ScheduleCellContent(
      session: foundSession,
      speakers: speakersList,
      onScheduleTap: (context) {
        Utils.showSessionInfo(
          context,
          ScheduleSessionContainer(
            session: foundSession,
            speakers: speakersList,
          ),
        );
      },
    );
  }

  return Container(color: Colors.grey.withValues(alpha: 0.125));
});

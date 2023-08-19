import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_day.model.dart';
import 'package:flutter_conf_colombia/features/schedule/data/repositories/schedule_repository.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

final scheduleRepositoryProvider = Provider((ref) {
  return ScheduleRepository();
});

final scheduleFutureProvider = FutureProvider<List<ScheduleDayModel>>((ref) {
  return ref.read(scheduleRepositoryProvider).getEventSchedule();
});

final scheduleDaySelectionProvider = StateProvider<DateTime?>(
  (ref) => null,
);

final timeFormatterProvider = Provider.family((ref, DateTime time) {

  final loc = tz.getLocation('America/Bogota');
  final date = tz.TZDateTime(loc, time.year, time.month, time.day, time.hour, time.minute, time.second);
  final formatter = DateFormat('h:mm a', 'es_CO');
  final formatted = formatter.format(date);
  return formatted;
});

final shortDateFormatterProvider = Provider.family((ref, DateTime time) {

  final appLoc = ref.watch(appLocalizationsProvider);
  final loc = tz.getLocation('America/Bogota');
  final date = tz.TZDateTime(loc, time.year, time.month, time.day, time.hour, time.minute, time.second);
  final formatter = DateFormat('EEE, MMM d', appLoc.localeName);
  final formatted = formatter.format(date);
  return formatted;
});

final currentEventLocationTimeProvider = Provider.family((ref, DateTime sessionTime) {
    final detroit = tz.getLocation('America/Bogota');
    final now = tz.TZDateTime.now(detroit);
    return now.minute > sessionTime.minute;
});







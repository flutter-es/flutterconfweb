import 'package:flutter_conf_core/flutter_conf_core.dart';
import 'package:intl/intl.dart';

typedef SlotSession = ({String slotId, SessionTypes type});
typedef MapSlotSessions = Map<SlotSession, List<EventDaySessionRelation>>;

extension EventDayEntityX on EventDayEntity {
  List<ScheduleSlotInfo> get scheduleSlots {
    final sessions = this.sessions ?? [];
    final slotMap = <String, List<EventDaySessionRelation>>{};

    for (final session in sessions) {
      final dateString = DateFormat('HH_mm').format(session.startTime);
      final key = '${id}_$dateString';

      slotMap[key] = [...(slotMap[key] ?? []), session];
    }

    return slotMap.entries.map((entry) {
      return ScheduleSlotInfo(
        id: entry.key,
        name: entry.key,
        sessions: entry.value,
      );
    }).toList();
  }
}

class ScheduleSlotInfo {
  ScheduleSlotInfo({
    required this.id,
    required this.name,
    required this.sessions,
  });

  final String id;
  final String name;
  final List<EventDaySessionRelation> sessions;
}

extension ScheduleSlotInfoX on ScheduleSlotInfo {
  MapSlotSessions get scheduleSlotSessions {
    final sessionSlots = <SlotSession, List<EventDaySessionRelation>>{};
    for (final session in sessions) {
      final dateString = DateFormat('HH_mm').format(session.startTime);
      final key = (slotId: '${id}_$dateString', type: session.sessionType);

      sessionSlots[key] = [...(sessionSlots[key] ?? []), session];
    }
    return sessionSlots;
  }
}

extension SlotSessionX on SlotSession {
  bool get isWorkshopOrHackathon => type == .workshop || type == .hackathon;
}

extension MapSlotSessionsX on MapSlotSessions {
  MapSlotSessions get others => {
    for (final item in entries)
      if (!item.key.isWorkshopOrHackathon) item.key: item.value,
  };

  MapSlotSessions get workshopsHacks => {
    for (final item in entries)
      if (item.key.isWorkshopOrHackathon) item.key: item.value,
  };
}

extension EventDaySessionRelationX on EventDaySessionRelation {
  bool get isTalkingTrack {
    return sessionType == .lightningTalk ||
        sessionType == .talk ||
        sessionType == .workshop ||
        sessionType == .hackathon;
  }

  int get trackNumber => (dynamicTrack?.orderIndex ?? 0) + 1;

  List<EventDaySessionCallForPaperSpeaker> get speakers {
    return callForPaper?.speakers ?? [];
  }
}

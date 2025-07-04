import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule_response_model.g.dart';

@JsonSerializable(createToJson: false)
class ScheduleResponseModel {
  ScheduleResponseModel({
    required this.id,
    required this.day,
    required this.slots,
  });

  factory ScheduleResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseModelFromJson(json);

  final String id;
  final int day;
  final List<ScheduleSlotModel> slots;
}

@JsonSerializable(createToJson: false)
class ScheduleSlotModel {
  ScheduleSlotModel({
    required this.id,
    required this.name,
    required this.scheduleTracks,
  });

  factory ScheduleSlotModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleSlotModelFromJson(json);

  final String id;
  final String name;
  final List<ScheduleTrackModel> scheduleTracks;
}

@JsonSerializable(createToJson: false)
class ScheduleTrackModel {
  ScheduleTrackModel({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.track,
    required this.speakers,
    required this.tags,
    required this.startDate,
    required this.endDate,
    this.requirements,
  });

  factory ScheduleTrackModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleTrackModelFromJson(json);

  final String id;
  final String title;
  final String description;
  final ScheduleType type;
  final int track;
  final List<SessionSpeakerModel> speakers;
  final List<String> tags;
  final DateTime startDate;
  final DateTime endDate;
  final List<String>? requirements;
}

@JsonSerializable(createToJson: false)
class SessionSpeakerModel {
  SessionSpeakerModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory SessionSpeakerModel.fromJson(Map<String, dynamic> json) =>
      _$SessionSpeakerModelFromJson(json);

  final int id;
  final String name;
  final String imageUrl;
}

@JsonEnum()
enum ScheduleType {
  register,
  keynote,
  breaks,
  lunch,
  lighting,
  session,
  workshop,
  finish,
}

typedef SlotSession = ({String slotId, ScheduleType type});
typedef MapSlotSessions = Map<SlotSession, List<ScheduleTrackModel>>;

extension ScheduleSlotModelX on ScheduleSlotModel {
  MapSlotSessions get scheduleSlots {
    final sessionSlots = <SlotSession, List<ScheduleTrackModel>>{};
    for (final session in scheduleTracks) {
      final dateString = DateFormat('HH_mm').format(session.startDate);
      final key = (slotId: '${id}_$dateString', type: session.type);

      sessionSlots[key] = [...(sessionSlots[key] ?? []), session];
    }
    return sessionSlots;
  }
}

extension MapSlotSessionsX on MapSlotSessions {
  MapSlotSessions get others => {
    for (final item in entries)
      if (item.key.type != ScheduleType.workshop) item.key: item.value,
  };

  MapSlotSessions get workshops => {
    for (final item in entries)
      if (item.key.type == ScheduleType.workshop) item.key: item.value,
  };
}

import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule_response_model.g.dart';

@JsonSerializable(createToJson: false)
class ScheduleResponseModel {
  ScheduleResponseModel({required this.id, required this.days});

  factory ScheduleResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseModelFromJson(json);

  @JsonKey(name: 'conferenceId')
  final String id;
  final List<ScheduleDayModel> days;
}

@JsonSerializable(createToJson: false)
class ScheduleDayModel {
  ScheduleDayModel({
    required this.id,
    required this.day,
    required this.date,
    required this.slots,
  });

  factory ScheduleDayModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDayModelFromJson(json);

  final String id;
  final int day;
  final DateTime date;
  final List<ScheduleSlotModel> slots;
}

@JsonSerializable(createToJson: false)
class ScheduleSlotModel {
  ScheduleSlotModel({
    required this.id,
    required this.name,
    required this.sessions,
  });

  factory ScheduleSlotModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleSlotModelFromJson(json);

  final String id;
  final String name;
  final List<ScheduleSessionModel> sessions;
}

@JsonSerializable(createToJson: false)
class ScheduleSessionModel {
  ScheduleSessionModel({
    required this.id,
    required this.type,
    required this.track,
    required this.startDate,
    required this.endDate,
    this.title,
    this.description,
    this.speakers,
    this.tags,
    this.requirements,
  });

  factory ScheduleSessionModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleSessionModelFromJson(json);

  final String id;
  final ScheduleType type;
  final int track;
  final DateTime startDate;
  final DateTime endDate;
  final String? title;
  final String? description;
  final List<SessionSpeakerModel>? speakers;
  final List<String>? tags;
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

  final String id;
  final String name;
  final String imageUrl;
}

@JsonEnum()
enum ScheduleType {
  register,
  keynote,
  panel,
  breaks,
  lunch,
  lighting,
  session,
  workshop,
  finish,
}

typedef SlotSession = ({String slotId, ScheduleType type});
typedef MapSlotSessions = Map<SlotSession, List<ScheduleSessionModel>>;

extension ScheduleSlotModelX on ScheduleSlotModel {
  MapSlotSessions get scheduleSlots {
    final sessionSlots = <SlotSession, List<ScheduleSessionModel>>{};
    for (final session in sessions) {
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

extension ScheduleTrackModelX on ScheduleSessionModel {
  bool get isTalkingTrack {
    return type == ScheduleType.session ||
        type == ScheduleType.workshop ||
        type == ScheduleType.lighting;
  }
}

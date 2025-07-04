import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session_response_model.g.dart';

@JsonSerializable(createToJson: false)
class SessionResponseModel {
  SessionResponseModel({
    required this.id,
    required this.day,
    required this.slots,
  });

  factory SessionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SessionResponseModelFromJson(json);

  final String id;
  final int day;
  final List<SessionSlotModel> slots;
}

@JsonSerializable(createToJson: false)
class SessionSlotModel {
  SessionSlotModel({
    required this.id,
    required this.name,
    required this.sessions,
  });

  factory SessionSlotModel.fromJson(Map<String, dynamic> json) =>
      _$SessionSlotModelFromJson(json);

  final String id;
  final String name;
  final List<SessionTrackModel> sessions;
}

@JsonSerializable(createToJson: false)
class SessionTrackModel {
  SessionTrackModel({
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

  factory SessionTrackModel.fromJson(Map<String, dynamic> json) =>
      _$SessionTrackModelFromJson(json);

  final String id;
  final String title;
  final String description;
  final SessionType type;
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
enum SessionType {
  register,
  keynote,
  breaks,
  lighting,
  session,
  workshop,
  finish,
}

typedef SlotSession = ({String slotId, SessionType type});
typedef MapSlotSessions = Map<SlotSession, List<SessionTrackModel>>;

extension SessionSlotModelX on SessionSlotModel {
  MapSlotSessions get sessionSlots {
    final sessionSlots = <SlotSession, List<SessionTrackModel>>{};
    for (final session in sessions) {
      final dateString = DateFormat('HH_mm').format(session.startDate);
      final key = (slotId: '${id}_$dateString', type: session.type);

      sessionSlots[key] = [...(sessionSlots[key] ?? []), session];
    }
    return sessionSlots;
  }
}

extension MapSlotSessionsX on MapSlotSessions {
  MapSlotSessions get otherSessions => {
    for (final item in entries)
      if (item.key.type != SessionType.workshop) item.key: item.value,
  };

  MapSlotSessions get workshopSessions => {
    for (final item in entries)
      if (item.key.type == SessionType.workshop) item.key: item.value,
  };
}

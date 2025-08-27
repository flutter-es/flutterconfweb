// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleResponseModel _$ScheduleResponseModelFromJson(
  Map<String, dynamic> json,
) => ScheduleResponseModel(
  id: json['conferenceId'] as String,
  days: (json['days'] as List<dynamic>)
      .map((e) => ScheduleDayModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

ScheduleDayModel _$ScheduleDayModelFromJson(Map<String, dynamic> json) =>
    ScheduleDayModel(
      id: json['id'] as String,
      day: (json['day'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      slots: (json['slots'] as List<dynamic>)
          .map((e) => ScheduleSlotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ScheduleSlotModel _$ScheduleSlotModelFromJson(Map<String, dynamic> json) =>
    ScheduleSlotModel(
      id: json['id'] as String,
      name: json['name'] as String,
      sessions: (json['sessions'] as List<dynamic>)
          .map((e) => ScheduleSessionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ScheduleSessionModel _$ScheduleSessionModelFromJson(
  Map<String, dynamic> json,
) => ScheduleSessionModel(
  id: json['id'] as String,
  title: json['title'] as String,
  type: $enumDecode(_$ScheduleTypeEnumMap, json['type']),
  track: (json['track'] as num).toInt(),
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  description: json['description'] as String?,
  speakers: (json['speakers'] as List<dynamic>?)
      ?.map((e) => SessionSpeakerModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  requirements: (json['requirements'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

const _$ScheduleTypeEnumMap = {
  ScheduleType.checkIn: 'checkIn',
  ScheduleType.keynote: 'keynote',
  ScheduleType.panel: 'panel',
  ScheduleType.breaks: 'breaks',
  ScheduleType.lunch: 'lunch',
  ScheduleType.lighting: 'lighting',
  ScheduleType.session: 'session',
  ScheduleType.workshop: 'workshop',
  ScheduleType.finish: 'finish',
};

SessionSpeakerModel _$SessionSpeakerModelFromJson(Map<String, dynamic> json) =>
    SessionSpeakerModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionResponseModel _$SessionResponseModelFromJson(
  Map<String, dynamic> json,
) => SessionResponseModel(
  id: json['id'] as String,
  day: (json['day'] as num).toInt(),
  slots: (json['slots'] as List<dynamic>)
      .map((e) => SessionSlotModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

SessionSlotModel _$SessionSlotModelFromJson(Map<String, dynamic> json) =>
    SessionSlotModel(
      id: json['id'] as String,
      name: json['name'] as String,
      sessions: (json['sessions'] as List<dynamic>)
          .map((e) => SessionTrackModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

SessionTrackModel _$SessionTrackModelFromJson(Map<String, dynamic> json) =>
    SessionTrackModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$SessionTypeEnumMap, json['type']),
      track: (json['track'] as num).toInt(),
      speakers: (json['speakers'] as List<dynamic>)
          .map((e) => SessionSpeakerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      requirements: (json['requirements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

const _$SessionTypeEnumMap = {
  SessionType.register: 'register',
  SessionType.keynote: 'keynote',
  SessionType.breaks: 'breaks',
  SessionType.lighting: 'lighting',
  SessionType.session: 'session',
  SessionType.workshop: 'workshop',
  SessionType.finish: 'finish',
};

SessionSpeakerModel _$SessionSpeakerModelFromJson(Map<String, dynamic> json) =>
    SessionSpeakerModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );

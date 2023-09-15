import 'package:flutter_conf_colombia/helpers/enums.dart';

class SessionModel {

  final String description;
  final String format;
  final String language;
  final String level;
  final String speakerId;
  final String title;
  final List<String> tags;
  final bool isAnnounced;
  final List<String> speakers;
  final SessionType sessionType;
  final int scheduleSlot;

  const SessionModel({
    required this.description, 
    required this.format, 
    required this.language, 
    required this.level, 
    required this.speakerId, 
    required this.title, 
    required this.tags,
    required this.isAnnounced,
    required this.speakers,
    required this.sessionType,
    required this.scheduleSlot,
  });

  factory SessionModel.fromFirestore(Map<String, dynamic> json) {
    return SessionModel(
      isAnnounced: bool.parse(json['isAnnounced'].toString()),
      description: json['description'].toString(),
      format: json['format'].toString(), 
      language: json['language'].toString(), 
      level: json['level'].toString(), 
      speakerId: json['speakerId'].toString(), 
      title: json['title'].toString(), 
      tags: (json['tags'] as List<dynamic>).map((e) => e.toString()).toList(),
      sessionType: SessionType.values.firstWhere((s) => s.name == json['sessionType']),
      speakers: (json['speakers'] as List<dynamic>).map((e) => e.toString()).toList(),
      scheduleSlot: json.containsKey('scheduleSlot') ? int.parse(json['scheduleSlot'].toString()) : 0,
    );
  }

  SessionModel copyWith({
    String? description,
    String? format,
    String? language,
    String? level,
    String? speakerID,
    String? title,
    List<String>? tags,
    int? slotIndex,
  }) {
    return SessionModel(
      isAnnounced: isAnnounced ?? this.isAnnounced,
      description: description ?? this.description, 
      format: format ?? this.format, 
      language: language ?? this.language, 
      level: level ?? this.level, 
      speakerId: speakerID ?? this.speakerId, 
      title: title ?? this.title, 
      tags: tags ?? this.tags,
      sessionType: sessionType ?? this.sessionType,
      speakers: speakers ?? this.speakers,
      scheduleSlot: slotIndex ?? this.scheduleSlot
    );
  }
}

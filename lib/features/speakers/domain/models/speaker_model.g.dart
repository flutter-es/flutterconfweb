// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speaker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeakerModel _$SpeakerModelFromJson(Map<String, dynamic> json) => SpeakerModel(
  id: json['id'] as String,
  name: json['name'] as String,
  photo: json['photo'] as String,
  photoTransparent: json['photo_transparent'] as String,
  country: json['country'] as String,
  countryFlag: json['country_flag'] as String,
  title: json['title'] as String,
  company: json['company'] as String? ?? '',
  socialMediaLinks:
      (json['social_media_links'] as List<dynamic>?)
          ?.map((e) => SocialMediaLinkModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  description: json['description'] as String?,
);

SocialMediaLinkModel _$SocialMediaLinkModelFromJson(
  Map<String, dynamic> json,
) => SocialMediaLinkModel(
  link: json['link'] as String,
  type: $enumDecode(_$SocialMediaEnumMap, json['type']),
);

const _$SocialMediaEnumMap = {
  SocialMedia.linkedin: 'linkedin',
  SocialMedia.github: 'github',
  SocialMedia.twitter: 'twitter',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialMediaModel _$SocialMediaModelFromJson(Map<String, dynamic> json) =>
    SocialMediaModel(
      type: $enumDecode(_$SocialMediaTypeEnumMap, json['type']),
      label: json['label'] as String,
      link: json['link'] as String,
    );

const _$SocialMediaTypeEnumMap = {
  SocialMediaType.youtube: 'youtube',
  SocialMediaType.linkedIn: 'linkedIn',
  SocialMediaType.tikTok: 'tikTok',
  SocialMediaType.twitter: 'twitter',
  SocialMediaType.facebook: 'facebook',
  SocialMediaType.instagram: 'instagram',
};

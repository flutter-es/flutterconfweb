// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SponsorModel _$SponsorModelFromJson(Map<String, dynamic> json) => SponsorModel(
  id: json['id'] as String,
  name: json['name'] as String,
  logo: json['logo'] as String,
  url: json['url'] as String,
  level: $enumDecode(_$SponsorLevelEnumMap, json['level']),
);

const _$SponsorLevelEnumMap = {
  SponsorLevel.platinum: 'platinum',
  SponsorLevel.gold: 'gold',
  SponsorLevel.silver: 'silver',
  SponsorLevel.bronze: 'bronze',
  SponsorLevel.inKind: 'inKind',
  SponsorLevel.senior: 'senior',
};

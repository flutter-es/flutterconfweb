// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizersModel _$OrganizersModelFromJson(Map<String, dynamic> json) =>
    OrganizersModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      countryFlag: json['country_flag'] as String,
      imageUrl: json['image_url'] as String,
      levels: (json['levels'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

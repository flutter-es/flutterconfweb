import 'package:json_annotation/json_annotation.dart';

part 'sponsor_model.g.dart';

@JsonSerializable(createToJson: false)
class SponsorModel {
  SponsorModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.url,
    required this.level,
  });

  factory SponsorModel.fromJson(Map<String, dynamic> json) =>
      _$SponsorModelFromJson(json);

  final String id;
  final String name;
  final String logo;
  final String url;
  final SponsorLevel level;
}

@JsonEnum()
enum SponsorLevel { platinum, gold, solver, inKind }

import 'package:json_annotation/json_annotation.dart';

part 'speaker_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class SpeakerModel {
  SpeakerModel({
    required this.id,
    required this.name,
    required this.photo,
    required this.photoTransparent,
    required this.country,
    required this.countryFlag,
    required this.title,
    this.company = '',
    this.socialMediaLinks = const [],
    this.description,
  });

  factory SpeakerModel.fromJson(Map<String, dynamic> json) =>
      _$SpeakerModelFromJson(json);

  final String id;
  final String name;
  final String photo;
  final String photoTransparent;
  final String country;
  final String countryFlag;
  final String title;
  final String company;
  final List<SocialMediaLinkModel> socialMediaLinks;
  final String? description;
}

enum SocialMedia { linkedin, github, twitter }

@JsonSerializable(createToJson: false)
class SocialMediaLinkModel {
  SocialMediaLinkModel({required this.link, required this.type});

  factory SocialMediaLinkModel.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaLinkModelFromJson(json);

  final String link;
  final SocialMedia type;
}

import 'package:json_annotation/json_annotation.dart';

part 'communities_model.g.dart';

@JsonSerializable(createToJson: false)
class CommunitiesModel {
  CommunitiesModel({
    required this.id,
    required this.image,
    required this.name,
    required this.url,
  });

  factory CommunitiesModel.fromJson(Map<String, dynamic> json) =>
      _$CommunitiesModelFromJson(json);

  final String id;
  final String image;
  final String name;
  final String url;
}

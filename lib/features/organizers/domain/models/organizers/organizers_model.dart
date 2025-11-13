import 'package:json_annotation/json_annotation.dart';

part 'organizers_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class OrganizersModel {
  OrganizersModel({
    required this.id,
    required this.name,
    required this.countryFlag,
    required this.imageUrl,
    required this.levels,
  });

  factory OrganizersModel.fromJson(Map<String, dynamic> json) =>
      _$OrganizersModelFromJson(json);

  final String id;
  final String name;
  final String countryFlag;
  final String imageUrl;
  final List<String> levels;
}

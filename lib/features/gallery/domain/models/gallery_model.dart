import 'package:json_annotation/json_annotation.dart';

part 'gallery_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class GalleryModel {
  GalleryModel({required this.id, required this.imageUrl});

  factory GalleryModel.fromJson(Map<String, dynamic> json) =>
      _$GalleryModelFromJson(json);

  final String id;
  final String imageUrl;
}

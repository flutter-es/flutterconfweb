import 'package:json_annotation/json_annotation.dart';

part 'faq_model.g.dart';

@JsonSerializable(createToJson: false)
class FaqModel {
  FaqModel({required this.id, required this.question, required this.answer});

  factory FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);

  final String id;
  final String question;
  final String answer;
}

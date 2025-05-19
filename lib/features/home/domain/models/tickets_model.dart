import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tickets_model.g.dart';

@JsonSerializable(createToJson: false)
class TicketsModel {
  TicketsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.endDate,
    required this.features,
    required this.isVisible,
  });

  factory TicketsModel.fromJson(Map<String, dynamic> json) =>
      _$TicketsModelFromJson(json);

  final TicketType id;
  final String title;
  final double price;

  @JsonKey(readValue: _setToDate)
  final DateTime endDate;

  final List<String> features;
  final bool isVisible;
}

@JsonEnum(fieldRename: FieldRename.kebab)
enum TicketType { early, regular, late }

String? _setToDate(Map<dynamic, dynamic> map, String key) {
  final dateTimestamp = map[key] as Timestamp?;
  if (dateTimestamp == null) return null;
  return dateTimestamp.toDate().toLocal().toString();
}

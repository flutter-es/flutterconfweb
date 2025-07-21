import 'package:json_annotation/json_annotation.dart';

part 'tickets_model.g.dart';

@JsonSerializable(createToJson: false)
class TicketsModel {
  TicketsModel({
    required this.id,
    required this.type,
    required this.title,
    required this.price,
    required this.endDate,
    required this.features,
  });

  factory TicketsModel.fromJson(Map<String, dynamic> json) =>
      _$TicketsModelFromJson(json);

  final String id;
  final TicketType type;
  final String title;
  final double price;
  final DateTime endDate;
  final List<String> features;
}

@JsonEnum()
enum TicketType { early, regular, late }

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketsModel _$TicketsModelFromJson(Map<String, dynamic> json) => TicketsModel(
  id: json['id'] as String,
  type: $enumDecode(_$TicketTypeEnumMap, json['type']),
  title: json['title'] as String,
  price: (json['price'] as num).toDouble(),
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  features: (json['features'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

const _$TicketTypeEnumMap = {
  TicketType.preEarly: 'preEarly',
  TicketType.early: 'early',
  TicketType.regular: 'regular',
  TicketType.late: 'late',
};

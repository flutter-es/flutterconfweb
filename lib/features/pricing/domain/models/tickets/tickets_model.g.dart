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
  endDate: DateTime.parse(json['endDate'] as String),
  features: (json['features'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

const _$TicketTypeEnumMap = {
  TicketType.early: 'early',
  TicketType.regular: 'regular',
  TicketType.late: 'late',
};

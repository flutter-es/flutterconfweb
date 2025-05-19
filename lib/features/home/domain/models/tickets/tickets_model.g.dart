// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketsModel _$TicketsModelFromJson(Map<String, dynamic> json) => TicketsModel(
  id: $enumDecode(_$TicketTypeEnumMap, json['id']),
  title: json['title'] as String,
  price: (json['price'] as num).toDouble(),
  endDate: DateTime.parse(_setToDate(json, 'endDate') as String),
  features:
      (json['features'] as List<dynamic>).map((e) => e as String).toList(),
  isVisible: json['isVisible'] as bool,
);

const _$TicketTypeEnumMap = {
  TicketType.early: 'early',
  TicketType.regular: 'regular',
  TicketType.late: 'late',
};

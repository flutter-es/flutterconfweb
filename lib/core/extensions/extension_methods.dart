import 'dart:ui';

import 'package:flutter_conf_core/flutter_conf_core.dart';

extension StringX on String {
  bool get isValidUrl => Uri.parse(this).isAbsolute;

  Color get toColor {
    final h = replaceAll('#', '');
    return Color(int.parse('FF$h', radix: 16));
  }
}

extension DateTimeX on DateTime {
  TicketPricingEntity? ticketDate(List<TicketPricingEntity> data) {
    for (final ticket in data) {
      if (!isBefore(ticket.startDate) && !isAfter(ticket.endDate)) {
        return ticket;
      }
    }
    return null;
  }
}

import 'package:flutter_conf_latam/features/tickets/data/repositories/ticketsection.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ticketSectionRepositoryProvider = Provider((ref) {
  return TicketSectionRepository(ref);
});

final ticketSectionProvider = Provider((ref) {
  return ref.watch(ticketSectionRepositoryProvider).getTicketSectionData();
});

import 'package:flutter_conf_colombia/features/tickets/data/models/ticketsection.model.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TicketSectionRepository {
  TicketSectionRepository(this.ref);

  final Ref ref;

  TicketSectionModel getTicketSectionData() {
    final appLoc = ref.watch(appLocalizationsProvider);

    return TicketSectionModel(
      slogan: appLoc.ticketBannerSlogan,
      ticketBtnLabel: appLoc.getYourTicket,
      ticketLink: 'https://express.culqi.com/pago/CPTYOG4LS0',
      announcement: appLoc.ticketsAnnouncementMessage,
    );
  }
}

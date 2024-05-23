import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/cfp/presentation/pages/cfp_page.dart';
import 'package:flutter_conf_colombia/features/contact/presentation/pages/contact.page.dart';
import 'package:flutter_conf_colombia/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_colombia/features/navigation/data/models/tab_navigation_item.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/pages/schedule_page.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/pages/speakers_page.dart';
import 'package:flutter_conf_colombia/features/sponsors/presentation/pages/sponsors_page.dart';
import 'package:flutter_conf_colombia/features/tickets/presentation/pages/tickets_page.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationRepository {
  const NavigationRepository(this.ref);
  final Ref ref;

  List<TabNavigationItem> getNavigation() {
    final appLoc = ref.watch(appLocalizationsProvider);

    return [
      TabNavigationItem(
        label: appLoc.home,
        route: HomePage.route,
        isSelected: true,
        display: false,
      ),
      /*TabNavigationItem(
        label: appLoc.cfp,
        route: CFPPage.route,
      ),*/
      TabNavigationItem(
        label: appLoc.tickets,
        route: TicketsPage.route,
      ),
      TabNavigationItem(
        label: appLoc.speakers,
        route: SpeakersPage.route,
      ),
      TabNavigationItem(
        label: appLoc.sponsors,
        route: SponsorsPage.route,
      ),
      /*
      TabNavigationItem(
        label: appLoc.schedule,
        route: SchedulePage.route,
      ),*/
      TabNavigationItem(
        label: appLoc.contact,
        route: ContactPage.route,
      ),
    ];
  }
}

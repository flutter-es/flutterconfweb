import 'package:flutter_conf_colombia/features/cfp/presentation/widgets/cfp_container.dart';
import 'package:flutter_conf_colombia/features/home/data/models/home_section.dart';
import 'package:flutter_conf_colombia/features/home/presentation/widgets/event_features_container.dart';
import 'package:flutter_conf_colombia/features/home/presentation/widgets/home_container.dart';
import 'package:flutter_conf_colombia/features/home/presentation/widgets/wip_container.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/widgets/speakers_container.dart';
import 'package:flutter_conf_colombia/features/sponsors/presentation/widgets/sponsors_container.dart';
import 'package:flutter_conf_colombia/features/tickets/presentation/widgets/tickets_container.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeSectionsRepository {
  const HomeSectionsRepository(this.ref);

  final Ref ref;

  List<HomeSection> getHomeSections() {
    final appLoc = ref.watch(appLocalizationsProvider);

    return [
      HomeSection(
        builder: (_) => HomeContainer(),
        size: HomeContainer.height,
        title: appLoc.about,
      ),
      
      HomeSection(
        builder: (_) => const CfpContainer(),
        size: CfpContainer.height,
        title: appLoc.cfp,
      ),
      HomeSection(
        builder: (_) => const EventFeaturesContainer(),
        size: EventFeaturesContainer.height,
        title: appLoc.eventFeatures,
      ),
      HomeSection(
        builder: (_) => const TicketsContainer(),
        size: TicketsContainer.height,
        title: appLoc.tickets,
      ),
      HomeSection(
        builder: (_) => const SpeakersContainer(),
        size: SpeakersContainer.height,
        title: appLoc.speakers,
      ),
      HomeSection(
        builder: (_) => const SponsorsContainer(),
        size: SponsorsContainer.height,
        title: appLoc.sponsors,
      ),
    ];
  }
}

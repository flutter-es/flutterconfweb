import 'package:flutter_conf_colombia/features/cfp/presentation/widgets/cfp_container.dart';
import 'package:flutter_conf_colombia/features/communities/presentation/widgets/communities_container.dart';
import 'package:flutter_conf_colombia/features/home/data/models/home_section.dart';
import 'package:flutter_conf_colombia/features/home/presentation/widgets/datelocation_container.dart';
import 'package:flutter_conf_colombia/features/home/presentation/widgets/event_features_container.dart';
import 'package:flutter_conf_colombia/features/home/presentation/widgets/home_container.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/widgets/speakers_container.dart';
import 'package:flutter_conf_colombia/features/sponsors/presentation/widgets/sponsors_container.dart';
import 'package:flutter_conf_colombia/features/tickets/presentation/widgets/tickets_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeSectionsRepository {
  const HomeSectionsRepository(this.ref);

  final Ref ref;

  List<HomeSection> getHomeSections() {
    return [
      HomeSection(
        builder: (_) => HomeContainer(),
      ),
      HomeSection(
        builder: (_) => const DateLocationContainer(),
      ),
      HomeSection(
        builder: (_) => const CfpContainer(),
      ),
      HomeSection(
        builder: (_) => const TicketsContainer(),
      ),
      HomeSection(
        builder: (_) => const EventFeaturesContainer(),
      ),
      HomeSection(
        builder: (_) => const SpeakersContainer(),
      ),
      HomeSection(
        builder: (_) => const SponsorsContainer(),
      ),
      HomeSection(
        builder: (_) => const CommunitiesContainer(),
      ),
    ];
  }
}

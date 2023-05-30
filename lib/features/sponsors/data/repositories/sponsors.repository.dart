import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/sponsors/data/models/sponsor.model.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SponsorsRepository {

  const SponsorsRepository(this.ref);

  final Ref ref;

  Future<List<SponsorModel>> getSponsors() {

    return Future.delayed(Duration.zero, () {
      return const [
        SponsorModel(
          imgUrl: './assets/images/sponsors/flutter_logo.svg', 
          name: 'Flutter', 
          level: SponsorshipLevels.platinum, 
          link: 'https://flutter.dev',
        ),
        SponsorModel(
          imgUrl: './assets/images/sponsors/invertase_logo.svg', 
          name: 'Invertase', 
          level: SponsorshipLevels.platinum, 
          link: 'https://invertase.io/',
        ),
        SponsorModel(
          imgUrl: './assets/images/sponsors/bancolombia_logo.svg', 
          name: 'Bancolombia', 
          level: SponsorshipLevels.platinum, 
          link: 'https://www.bancolombia.com/',
        ),
      ];
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/sponsors/presentation/widgets/sponsors_region.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';

class SponsorsList extends StatelessWidget {
  const SponsorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SponsorsRegion(
          level: SponsorshipLevels.platinum,
        ),
        SponsorsRegion(
          level: SponsorshipLevels.gold,
        ),
        SponsorsRegion(
          level: SponsorshipLevels.silver,
        ),
        SponsorsRegion(
          level: SponsorshipLevels.bronze,
        ),
      ],
    );
  }
}
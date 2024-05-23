import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/sponsors/data/models/sponsor.model.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SponsorWidget extends StatelessWidget {
  const SponsorWidget({required this.sponsor, super.key});

  final SponsorModel sponsor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Utils.launchUrlLink(sponsor.url);
        },
        child: SvgPicture.network(
          sponsor.logo,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}

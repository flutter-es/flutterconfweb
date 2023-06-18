import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/sponsors/data/models/sponsor.model.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SponsorWidget extends StatelessWidget {

  final SponsorModel sponsor;
  const SponsorWidget({
    required this.sponsor,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Utils.launchUrlLink(sponsor.link);
        },
        child: SvgPicture.asset(sponsor.imgUrl,
          width: 100, height: 100,
        ),
      ),
    );
  }
}

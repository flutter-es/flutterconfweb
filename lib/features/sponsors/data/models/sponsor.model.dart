import 'package:flutter_conf_colombia/helpers/enums.dart';

class SponsorModel {

  const SponsorModel({
    required this.imgUrl,
    required this.name,
    required this.level,
    required this.link,
  });

  final String imgUrl;
  final String name;
  final String link;
  final SponsorshipLevels level;
}

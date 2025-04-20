import 'package:flutter_conf_latam/helpers/enums.dart';

class SponsorModel {
  const SponsorModel({
    required this.logo,
    required this.name,
    required this.level,
    required this.url,
  });

  factory SponsorModel.fromFirestore(Map<String, dynamic> json) {
    return SponsorModel(
      logo: json['logo'].toString(),
      name: json['name'].toString(),
      level: SponsorshipLevels.values.firstWhere(
        (e) => e.name == json['level'],
      ),
      url: json['url'].toString(),
    );
  }

  final String logo;
  final String name;
  final String url;
  final SponsorshipLevels level;
}

import 'package:flutter_conf_latam/core/enums/enums.dart';

class SpeakerSocial {
  const SpeakerSocial({required this.type, required this.link});

  factory SpeakerSocial.fromFirestore(Map<String, dynamic> json) {
    return SpeakerSocial(
      link: json['link'].toString(),
      type: SocialMediaLinks.values.where((s) => s.name == json['type']).first,
    );
  }

  final SocialMediaLinks type;
  final String link;
}

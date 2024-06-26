import 'package:flutter_conf_colombia/helpers/enums.dart';

class SpeakerSocial {
  final SocialMediaLinks type;
  final String link;

  const SpeakerSocial({
    required this.type,
    required this.link
  });

  factory SpeakerSocial.fromFirestore(Map<String, dynamic> json) {
    return SpeakerSocial(
      link: json['link'].toString(),
      type: SocialMediaLinks.values.where((s) => s.name == json['type']).first,
    );
  }
}
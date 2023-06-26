import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker_social.model.dart';

class SpeakerModel {
  final String? name;
  final String? company;
  final String? photo;
  final String? description;
  final String? title;
  final String? country;
  final List<SpeakerSocial>? socialMediaLinks;
  final bool? display;

  SpeakerModel({
    this.name,
    this.title,
    this.company,
    this.photo,
    this.description,
    this.country,
    this.socialMediaLinks,
    this.display,
  });

  factory SpeakerModel.fromFirestore(Map<String, dynamic> json) {
    return SpeakerModel(
      name: json['name'].toString(),
      company: json['company'].toString(),
      title: json['title'].toString(),
      photo: json['photo'].toString(),
      description: json['description'].toString(),
      country: json['country_flag'].toString(),
      display: bool.parse(json['display'].toString()),
      socialMediaLinks: (json['social_media_links'] as List<dynamic>)
          .map((social) =>
              SpeakerSocial.fromFirestore(social as Map<String, dynamic>))
          .toList(),
    );
  }
}

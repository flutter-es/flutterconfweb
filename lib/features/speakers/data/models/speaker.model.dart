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
  final String? id;

  SpeakerModel({
    this.name,
    this.title,
    this.company,
    this.photo,
    this.description,
    this.country,
    this.socialMediaLinks,
    this.display,
    this.id,
  });

  factory SpeakerModel.fromFirestore(String id, Map<String, dynamic> json) {
    return SpeakerModel(
      id: id,
      name: json['name'].toString(),
      company: json['company'].toString(),
      title: json['title'].toString(),
      photo: json['photo'].toString(),
      description: json['description'].toString(),
      country: json['country_flag'].toString(),
      display: bool.parse(json['display'].toString()),
      socialMediaLinks: json.containsKey('social_media_links') ? (json['social_media_links'] as List<dynamic>)
          .map((social) =>
              SpeakerSocial.fromFirestore(social as Map<String, dynamic>))
          .toList() : [],
    );
  }
}

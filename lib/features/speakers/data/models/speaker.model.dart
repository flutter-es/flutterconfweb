import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker_social.model.dart';

class SpeakerModel {
  final String? name;
  final String? company;
  final String? photo;
  final String? description;
  final String? title;
  final List<SpeakerSocial>? socialMediaLinks;

  SpeakerModel({
    this.name,
    this.title,
    this.company,
    this.photo,
    this.description,
    this.socialMediaLinks,
  });

  factory SpeakerModel.fromFirestore(Map<String, dynamic> json) {
    return SpeakerModel(
      name: json['name'].toString(),
      company: json['company'].toString(),
      title: json['title'].toString(),
      photo: json['photo'].toString(),
      description: json['description'].toString(),
      socialMediaLinks: (json['social_media_links'] as List<dynamic>).map(
        (social) => SpeakerSocial.fromFirestore(social as Map<String, dynamic>)
      ).toList()
    );
  }
}



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class SpeakerModel extends StatefulWidget {
  final String? name;
  final String? company;
  final String? twitter;
  final String? linkedin;
  final String? photo;
  final DocumentSnapshot documentSnapshot;
  SpeakerModel({
    required this.documentSnapshot,
    this.name,
    this.company,
    this.twitter,
    this.linkedin,
    this.photo,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  factory SpeakerModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return SpeakerModel(
      name: data?['name'].toString(),
      company: data?['company'].toString(),
      twitter: data?['twitter'].toString(),
      linkedin: data?['linkedin'].toString(),
      photo: data?['photo'].toString(),
      documentSnapshot: data?['documentSnapshot'] as DocumentSnapshot,
    );
  }

  /*SpeakerModel copyWith({
    String? name,
    String? company,
    String? twitter,
    String? linkedin,
    String? photo,
  }) {
    return SpeakerModel(
      name: name ?? this.name,
      company: company ?? this.company,
      twitter: twitter ?? this.twitter,
      linkedin: linkedin ?? this.linkedin,
      photo: photo ?? this.photo,
    );
  }*/
}

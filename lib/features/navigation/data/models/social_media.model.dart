import 'package:flutter/material.dart';

class SocialMediaModel {
  const SocialMediaModel({
    required this.icon,
    required this.label,
    required this.link,
  });

  final IconData icon;
  final String label;
  final String link;
}

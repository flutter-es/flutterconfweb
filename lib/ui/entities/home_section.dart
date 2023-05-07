import 'package:flutter/material.dart';

class HomeSection {
  HomeSection({
    required this.builder,
    required this.size,
    required this.title,
  });

  final WidgetBuilder builder;
  final double size;
  final String title;

  @override
  String toString() {
    return 'HomeSection title=[$title]';
  }
}

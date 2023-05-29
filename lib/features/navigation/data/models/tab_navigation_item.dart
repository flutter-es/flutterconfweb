import 'package:flutter/material.dart';

class TabNavigationItem {

  const TabNavigationItem({
    required this.label,
    required this.route,
    this.isSelected = false,
  });

  final String label;
  final String route;
  final bool? isSelected;
}

import 'package:flutter/material.dart';

class EventFeaturesWrapper extends StatelessWidget {
  const EventFeaturesWrapper({
    required this.children,
    required this.axis,
    super.key,
  });

  final Axis axis;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return axis == Axis.horizontal
        ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: children,
        )
        : Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: children,
        );
  }
}

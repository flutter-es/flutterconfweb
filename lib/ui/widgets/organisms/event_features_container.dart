import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';

class EventFeaturesContainer extends StatelessWidget {
  const EventFeaturesContainer({super.key});

  static const height = 600.0;

  static const title = 'event_features';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: FlutterLatamColors.eventFeaturesColor,
      alignment: Alignment.center,
      child: const Text(title),
    );
  }
}

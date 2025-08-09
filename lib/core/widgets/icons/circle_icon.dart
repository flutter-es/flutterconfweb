import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 32,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: FlutterLatamColors.mediumBlue,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: child,
        ),
      ),
    );
  }
}

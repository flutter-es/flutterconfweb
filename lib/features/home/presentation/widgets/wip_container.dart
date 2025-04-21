import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/enums/enums.dart';
import 'package:flutter_conf_latam/features/shared/widgets/animations/flutter_rive_animated.dart';
import 'package:flutter_conf_latam/styles/colors.dart';

class WipContainer extends StatelessWidget {
  const WipContainer({super.key});

  static double height = 600;
  static const title = 'tickets_container';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterLatamColors.ticketBgTopColor,
            FlutterLatamColors.ticketBgBottomColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: const SizedBox(
              width: 500,
              height: 500,
              child: FlutterRiveAnimated(
                path: './assets/anims/flutterdash.riv',
                animation: FlutterConfAnimations.flutterDashConst,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

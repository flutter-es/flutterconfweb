import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/enums/enums.dart';
import 'package:flutter_conf_latam/core/widgets/animations/flutter_rive_animated.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';

class WipContainer extends StatelessWidget {
  const WipContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            FlutterLatamColors.ticketBgTopColor,
            FlutterLatamColors.ticketBgBottomColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: SizedBox.square(
              dimension: 500,
              child: FlutterRiveAnimated(
                path: Assets.animations.flutterdash,
                animation: FlutterConfAnimations.flutterDashConst,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

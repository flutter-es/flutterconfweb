import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/animations/flutter_dash_animations.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'dart:math' as math; // import this

class WipContainer extends StatelessWidget {
  const WipContainer({super.key});

  static double height = 600.0;
  static const title = 'tickets_container';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterLatamColors.ticketBgTopColor,
            FlutterLatamColors.ticketBgBottomColor
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
            child: SizedBox(
              width: 500.0,
              height: 500.0,
              child: const FlutterDashAnimation(
                animation: FlutterDashAnimations.flutterdashconst,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

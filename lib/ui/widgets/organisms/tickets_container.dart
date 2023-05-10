import 'package:flutter/material.dart';

import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/ui/widgets/animations/flutter_dash_animations.dart';

class TicketsContainer extends StatelessWidget {
  const TicketsContainer({super.key});

  static const height = 600.0;

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
      child: Stack(
        children: [
          Positioned(
            bottom: -200,
            left: 0,
            top: 0,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: const FlutterDashAnimation(
                  animation: FlutterDashAnimations.flutterdashticket,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

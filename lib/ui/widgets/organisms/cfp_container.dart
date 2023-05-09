import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/ui/widgets/animations/flutter_dash_animations.dart';

class CfpContainer extends StatelessWidget {
  const CfpContainer({super.key});

  static const height = 600.0;

  static const title = 'cfp_container';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
              FlutterLatamColors.cfpColor
          ],
        ),
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned(
            bottom: -50,
            right: 0,
            top: 0,
            child: Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: const FlutterDashAnimation(
                  animation: FlutterDashAnimations.flutterdashflag,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

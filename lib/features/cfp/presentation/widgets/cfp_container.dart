import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/cfp/presentation/providers/cfpfeature_providers.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/animations/flutter_logo_animated.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/circleround_iconbutton.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/animations/flutter_dash_animations.dart';
import 'package:flutter_conf_colombia/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CfpContainer extends ConsumerWidget {
  const CfpContainer({super.key});

  static const height = 600.0;

  static const title = 'cfp_container';

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final cfpSectionData = ref.watch(cfpSectionProvider);

    return Container(
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, FlutterLatamColors.cfpColor],
        ),
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 80),
              width: 400,
              height: 400,
              child: const FlutterLogoAnimated(),
            ),
          ),
          const Positioned(
            bottom: -20,
            right: 0,
            top: 0,
            child: Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 800,
                height: 800,
                child: FlutterDashAnimation(
                  animation: FlutterDashAnimations.flutterdashflag,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.all(80),
              child: CircleRoundIconButton(
                icon: FlutterConfLatamIcons.speaker,
                label: cfpSectionData.cfpButtonLabel,
                iconColor: Colors.white,
                backgroundColor: Color(0xFF3B9ED8),
                labelColor: Colors.white,
                circleColor: Color(0xFF0C5B8A),
                labelWeight: FontWeight.bold,
                onTap: () {
                  Utils.launchUrlLink(cfpSectionData.cfpUrlLink);
                }
              )),
          ),
        ],
      ),
    );
  }
}

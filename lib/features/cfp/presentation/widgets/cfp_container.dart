import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/features/cfp/presentation/providers/cfpfeature_providers.dart';
import 'package:flutter_conf_latam/features/cfp/presentation/responsiveness/cfp_responsive_config.dart';
import 'package:flutter_conf_latam/features/shared/widgets/animations/flutter_dash_animations.dart';
import 'package:flutter_conf_latam/features/shared/widgets/animations/flutter_logo_animated.dart';
import 'package:flutter_conf_latam/features/shared/widgets/circleround_iconbutton.dart';
import 'package:flutter_conf_latam/helpers/enums.dart';
import 'package:flutter_conf_latam/helpers/utils.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CfpContainer extends ConsumerWidget {
  const CfpContainer({super.key});

  static double height = 700;

  static const title = 'cfp_container';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cfpSectionData = ref.watch(cfpSectionProvider);
    final config = CFPBannerResponsiveConfig.getCFPBannerConfig(context);

    CfpContainer.height = config.bannerHeight;

    return Container(
      height: height,
      decoration: BoxDecoration(gradient: config.bannerGradient),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Align(
            alignment: config.logoAlignment,
            child: Container(
              margin: EdgeInsets.only(left: config.flutterLogoLeftMargin),
              width: config.flutterLogoSize,
              height: config.flutterLogoSize,
              child: const FlutterLogoAnimated(),
            ),
          ),
          Positioned(
            bottom: config.dashBottomOffset,
            right: 0,
            top: 0,
            left: 0,
            child: Align(
              alignment: config.dashAlignment,
              child: SizedBox(
                width: config.dashSize,
                height: config.dashSize,
                child: const FlutterDashAnimation(
                  animation: FlutterDashAnimations.flutterdashflag,
                ),
              ),
            ),
          ),
          Align(
            alignment: config.cfpButtonAlignment,
            child: Container(
              margin: EdgeInsets.all(config.cfpButtonMargin),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleRoundIconButton(
                    icon: FlutterConfLatamIcons.speaker,
                    label: cfpSectionData.cfpButtonLabel,
                    iconColor: Colors.white,
                    backgroundColor: FlutterLatamColors.lightBlue,
                    labelColor: Colors.white,
                    circleColor: FlutterLatamColors.darkBlue,
                    labelWeight: FontWeight.bold,
                    fontSize: config.cfpButtonLabelSize,
                    iconSize: config.cfpButtonIconSize,
                    iconPadding: config.cfpButtonIconPadding,
                    onTap: () {
                      Utils.launchUrlLink(cfpSectionData.cfpUrlLink);
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    cfpSectionData.cfpSubmitLabel,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: FlutterLatamColors.darkBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

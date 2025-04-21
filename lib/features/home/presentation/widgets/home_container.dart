import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/enums/enums.dart';
import 'package:flutter_conf_latam/features/home/presentation/providers/home_providers.dart';
import 'package:flutter_conf_latam/features/home/presentation/responsiveness/home_section_responsive_config.dart';
import 'package:flutter_conf_latam/features/shared/widgets/animations/flutter_rive_animated.dart';
import 'package:flutter_conf_latam/helpers/constants.dart';
import 'package:flutter_conf_latam/helpers/utils.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeContainer extends ConsumerWidget {
  HomeContainer({super.key});

  static double height = 700;

  static const title = 'home_container';

  final analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeContainerData = ref.watch(homeContainerDataProvider);
    final uiConfig = HomeSectionResponsiveConfig.getHomeSectionBannerConfig(
      context,
    );

    return SizedBox(
      height: uiConfig.bannerHeight,
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                '${Constants.imagesPath}/topbanner.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flex(
            direction: uiConfig.layoutDirection,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: uiConfig.sectionPadding,
                    vertical: uiConfig.sectionPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: uiConfig.titleAlignment,
                    children: [
                      Text(
                        homeContainerData.title,
                        textAlign: uiConfig.textAlign,
                        style: TextStyle(
                          height: 1,
                          color: FlutterLatamColors.blueText,
                          fontSize: uiConfig.titleSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        homeContainerData.content,
                        textAlign: uiConfig.textAlign,
                        style: TextStyle(
                          color: FlutterLatamColors.blueText,
                          fontSize: uiConfig.subtitleSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      bottom: uiConfig.dashBottomOffset,
                      left: 0,
                      top: 0,
                      child: SizedBox(
                        height: uiConfig.dashSize,
                        width: uiConfig.dashSize,
                        child: const FlutterRiveAnimated(
                          path: './assets/anims/flutterdash.riv',
                          animation: FlutterConfAnimations.flutterDashWave,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void clickCFP(String url) {
    analytics.logEvent(name: 'click_cfp');
    Utils.launchUrlLink(url);
  }
}

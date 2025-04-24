import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/enums/enums.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/animations/flutter_rive_animated.dart';
import 'package:flutter_conf_latam/features/home/presentation/providers/home_providers.dart';
import 'package:flutter_conf_latam/features/home/presentation/responsiveness/home_section_responsive_config.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
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
                Assets.images.topbanner,
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
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: uiConfig.dashBottomOffset,
                      child: SizedBox.square(
                        dimension: uiConfig.dashSize,
                        child: FlutterRiveAnimated(
                          path: Assets.animations.flutterdash,
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

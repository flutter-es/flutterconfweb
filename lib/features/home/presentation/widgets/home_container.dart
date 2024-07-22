import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/home/presentation/providers/home_providers.dart';
import 'package:flutter_conf_colombia/features/home/presentation/responsiveness/home_section_responsive_config.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/animations/flutter_dash_animations.dart';
import 'package:flutter_conf_colombia/helpers/constants.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeContainer extends ConsumerWidget {
  HomeContainer({super.key});

  static double height = 700;

  static const title = 'home_container';

  final analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeContainerData = ref.watch(homeContainerDataProvider);
    final uiConfig =
        HomeSectionResponsiveConfig.getHomeSectionBannerConfig(context);

    return SizedBox(
      height: uiConfig.bannerHeight,
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.9,
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
                          color: FlutterLatamColors.white,
                          fontSize: uiConfig.titleSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        homeContainerData.content,
                        textAlign: uiConfig.textAlign,
                        style: TextStyle(
                          color: FlutterLatamColors.white,
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
                      right: 0.0,
                      bottom: uiConfig.dashBottomOffset,
                      left: 0,
                      top: 0,
                      child: SizedBox(
                        height: uiConfig.dashSize,
                        width: uiConfig.dashSize,
                        child: const FlutterDashAnimation(),
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

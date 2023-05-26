import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/cfp/presentation/providers/cfpfeature_providers.dart';
import 'package:flutter_conf_colombia/features/home/presentation/providers/home_providers.dart';
import 'package:flutter_conf_colombia/features/home/presentation/responsiveness/home_section_responsive_config.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/animations/flutter_dash_animations.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/circleround_iconbutton.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeContainer extends ConsumerWidget {
  HomeContainer({super.key});

  static double height = 700;

  static const title = 'home_container';

  final analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final homeContainerData = ref.watch(homeContainerDataProvider);
    final uiConfig = HomeSectionResponsiveConfig.getHomeSectionBannerConfig(context);

    return SizedBox(
      height: uiConfig.bannerHeight,
      child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: uiConfig.sectionPadding,
            vertical: uiConfig.sectionPadding,
          ),
          child: Flex(
            direction: uiConfig.layoutDirection,
            children: [
              SizedBox(height: uiConfig.pageTopGap),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      homeContainerData.title,
                      textAlign: uiConfig.textAlign,
                      style: TextStyle(
                        fontSize: uiConfig.titleSize,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    Text(
                      homeContainerData.content,
                      textAlign: uiConfig.textAlign,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 60.0),
                    Row(
                      mainAxisAlignment: uiConfig.buttonRowAlignment,
                      children: [
                        CircleRoundIconButton(
                          icon: FlutterConfLatamIcons.speaker,
                          label: homeContainerData.buttonLabel,
                          iconColor: Colors.white,
                          backgroundColor: FlutterLatamColors.lightBlue,
                          labelColor: Colors.white,
                          circleColor: FlutterLatamColors.darkBlue,
                          labelWeight: FontWeight.w600,
                          fontSize: uiConfig.buttonLabelSize,
                          iconSize: uiConfig.buttonIconSize,
                          iconPadding: uiConfig.buttonIconPadding,
                          onTap: () => clickCFP(homeContainerData.cfpUrlLink),
                        ),
                      ],
                    ),
                    SizedBox(height: uiConfig.buttonBottomGap),
                    Text(
                      homeContainerData.dateLabel,
                      textAlign: uiConfig.textAlign,
                      style: TextStyle(
                        fontSize: uiConfig.dateSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: uiConfig.dateCountryRowAlignment,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 5.0,
                          ),
                          child: Image.asset(
                            'assets/images/colombia_flag.png',
                            height: uiConfig.flagSize,
                            width: uiConfig.flagSize,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          homeContainerData.countryLabel,
                          textAlign: uiConfig.textAlign,
                          style: TextStyle(
                            fontSize: uiConfig.countryLabelSize,
                            color: FlutterLatamColors.darkBlue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: 0.0,
                      bottom: 0.0,
                      left: uiConfig.dashLeftPosition,
                      child: SizedBox(
                        height: uiConfig.dashSize,
                        width: uiConfig.dashSize,
                        child: const FlutterDashAnimation(
                          animation: FlutterDashAnimations.flutterdashconst,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      );
  }

  void clickCFP(String url) {
    analytics.logEvent(name: 'click_cfp');
    Utils.launchUrlLink(url);
  }
}

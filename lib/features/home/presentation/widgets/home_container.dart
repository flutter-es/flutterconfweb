import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/count_down_text.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeContainer extends ConsumerWidget {
  HomeContainer({super.key});

  final _analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final homeContainerData = ref.watch(homeContainerDataProvider);
    // final uiConfig = HomeSectionResponsiveConfig.getHomeSectionBannerConfig(
    //   context,
    // );

    return ColoredBox(
      color: FlutterLatamColors.mainBlue,
      child: SizedBox(
        height: 1550,
        child: Column(
          spacing: 96,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 48),
              child: Column(
                spacing: 24,
                children: <Widget>[
                  Text(
                    'FlutterConfLatam 2025\nQuito - Ecuador',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1,
                      color: FlutterLatamColors.white,
                      fontFamily: 'Recoleta',
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '9 y 10 de Septiembre',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: FlutterLatamColors.white,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: SizedBox.fromSize(
                size: const Size(760, 750),
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      colors: [Color(0xFF2582C4), FlutterLatamColors.mainBlue],
                      stops: [0.4, 1],
                    ),
                  ),
                  child: Image.asset(Assets.images.ecuaDash),
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                text: '¡La experiencia Flutter te espera en la ',
                children: <InlineSpan>[
                  TextSpan(
                    text: 'Mitad del Mundo',
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: FlutterLatamColors.white,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  const TextSpan(text: '!'),
                ],
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: FlutterLatamColors.white,
                  fontSize: 40,
                ),
              ),
            ),
            CountDownText(
              startDate: DateTime.now(),
              endDate: DateTime(2025, 9, 10),
            ),
          ],
        ),
      ),
    );
  }

  void clickCFP(String url) {
    _analytics.logEvent(name: 'click_cfp');
    Utils.launchUrlLink(url);
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/count_down_text.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeMain extends ConsumerWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final config = ref.watch(configProvider);

    return SectionContainer(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => 48,
              ScreenSize.normal || ScreenSize.small => 24,
            },
          ),
          child: TitleSubtitleText(
            title: (
              text: l10n.homeMainTitle,
              size: switch (context.screenSize) {
                ScreenSize.extraLarge => 64,
                ScreenSize.large => 48,
                ScreenSize.normal || ScreenSize.small => 24,
              },
            ),
            subtitle: (
              text: l10n.homeMainDescription,
              size: switch (context.screenSize) {
                ScreenSize.extraLarge => 40,
                ScreenSize.large => 36,
                ScreenSize.normal || ScreenSize.small => 16,
              },
            ),
            spacing: switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => 24,
              ScreenSize.normal || ScreenSize.small => 12,
            },
          ),
        ),
        Center(
          child: SizedBox.fromSize(
            size: switch (context.screenSize) {
              ScreenSize.extraLarge => const Size(760, 750),
              ScreenSize.large => const Size(520, 513),
              ScreenSize.normal || ScreenSize.small => const Size(300, 296),
            },
            child: DecoratedBox(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    FlutterLatamColors.mediumBlue,
                    FlutterLatamColors.mainBlue,
                  ],
                  stops: [0.4, 1],
                ),
              ),
              child: Image.asset(Assets.images.ecuaDash),
            ),
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: l10n.homeMainExperienceOne,
            children: <InlineSpan>[
              TextSpan(
                text: l10n.homeMainExperienceTwo,
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: FlutterLatamColors.white,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Utils.launchUrlLink(config.countryPageUrl);
                  },
              ),
              const TextSpan(text: '!'),
            ],
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: FlutterLatamColors.white,
              fontSize: switch (context.screenSize) {
                ScreenSize.extraLarge || ScreenSize.large => 40,
                ScreenSize.normal || ScreenSize.small => 16,
              },
            ),
          ),
        ),
        CountDownText(
          startDate: DateTime.now(),
          endDate: DateTime(2025, 9, 10),
        ),
      ],
    );
  }
}

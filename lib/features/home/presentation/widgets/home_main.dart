import 'dart:async';

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
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeMain extends ConsumerWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.theme.fclThemeScheme;

    final l10n = ref.watch(appLocalizationsProvider);
    final config = ref.watch(configProvider);

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: .bottomCenter,
          end: .topCenter,
          colors: [FlutterLatamColors.mainBlue, FlutterLatamColors.steelBlue],
          stops: [0.77, 1.38],
        ),
      ),
      child: SectionContainer(
        children: <Widget>[
          Center(
            child: SizedBox.fromSize(
              size: switch (context.screenSize) {
                .extraLarge => const Size(760, 750),
                .large => const Size(520, 513),
                .normal || .small => const Size(300, 296),
              },
              child: Image.asset(Assets.images.surfDash),
            ),
          ),
          TitleSubtitleText(
            title: (
              text: l10n.homeMainTitle,
              size: switch (context.screenSize) {
                .extraLarge => 64,
                .large => 48,
                .normal || .small => 24,
              },
            ),
            subtitle: (
              text: l10n.homeMainDescription,
              size: switch (context.screenSize) {
                .extraLarge => 40,
                .large => 36,
                .normal || .small => 16,
              },
            ),
            spacing: switch (context.screenSize) {
              .extraLarge || .large => 24,
              .normal || .small => 12,
            },
          ),
          RichText(
            textAlign: .center,
            text: TextSpan(
              text: l10n.homeMainExperienceOne,
              children: <InlineSpan>[
                TextSpan(
                  text: l10n.homeMainExperienceTwo,
                  style: theme.typography.subH1Regular.copyWith(
                    decoration: .none,
                    fontSize: switch (context.screenSize) {
                      .extraLarge || .large => 40,
                      .normal || .small => 16,
                    },
                  ),
                ),
              ],
              style: theme.typography.subH1Regular.copyWith(
                decoration: .underline,
                decorationColor: FlutterLatamColors.white,
                fontSize: switch (context.screenSize) {
                  .extraLarge || .large => 40,
                  .normal || .small => 16,
                },
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => unawaited(
                  Utils.launchUrlLink(config.countryPageUrl),
                ),
            ),
          ),
          CountDownText(
            startDate: .now(),
            endDate: DateTime(2026, 9, 22, 7, 30),
          ),
        ],
      ),
    );
  }
}

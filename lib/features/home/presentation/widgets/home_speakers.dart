import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/routes/app_route_path.dart';
import 'package:flutter_conf_latam/core/routes/helpers/navigation_view_model.dart';
import 'package:flutter_conf_latam/core/widgets/button/fcl_button.dart';
import 'package:flutter_conf_latam/core/widgets/card/speaker_card_item.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/features/speakers/presentation/view_model/speakers_view_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeSpeakers extends ConsumerWidget {
  const HomeSpeakers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final randomSpeakersList = ref.watch(
      speakersRandomProvider(Locale(l10n.localeName)),
    );

    return randomSpeakersList.maybeWhen(
      data: (data) {
        final colSize = switch (context.screenSize) {
          ScreenSize.extraLarge => 4,
          _ => 2,
        };
        final imageSize = switch (context.screenSize) {
          ScreenSize.extraLarge || ScreenSize.large => const Size.square(206),
          ScreenSize.normal || ScreenSize.small => const Size.square(120),
        };

        return SectionContainer(
          spacing: 30,
          children: <Widget>[
            TitleSubtitleText(
              title: (
                text: l10n.homeSpeakersTitle,
                size: switch (context.screenSize) {
                  ScreenSize.extraLarge => 64,
                  ScreenSize.large => 48,
                  ScreenSize.normal || ScreenSize.small => 24,
                },
              ),
              subtitle: (
                text: l10n.homeSpeakersDescription,
                size: switch (context.screenSize) {
                  ScreenSize.extraLarge || ScreenSize.large => 24,
                  ScreenSize.normal || ScreenSize.small => 16,
                },
              ),
              spacing: 12,
            ),
            ResponsiveGrid(
              columnSizes: colSize,
              rowSizes: ((data.length + 1) / colSize).ceil(),
              children: <Widget>[
                for (final (index, item) in data.indexed)
                  SpeakerCardItem(
                    speaker: item,
                    imageSize: imageSize,
                    imageBackgroundColor: _speakerListColors[index],
                  ),
                const _RedirectSpeakersCard(),
              ],
            ),
          ],
        );
      },
      orElse: Offstage.new,
    );
  }
}

class _RedirectSpeakersCard extends ConsumerWidget {
  const _RedirectSpeakersCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final theme = context.theme.fclThemeScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: FlutterLatamColors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          spacing: 30,
          children: <Widget>[
            Text(
              l10n.homeSpeakersRedirectTitle,
              textAlign: TextAlign.center,
              style: theme.typography.h3Bold,
            ),
            FclButton.secondary(
              label: l10n.homeSpeakersRedirectDescription,
              buttonSize: ButtonSize.small,
              onPressed: () => _goToSpeakers(ref),
            ),
          ],
        ),
      ),
    );
  }

  void _goToSpeakers(WidgetRef ref) {
    ref
        .read(navigationViewModelProvider.notifier)
        .selectNavItemFromRoute('/${AppRoutePath.speakers.pathName}');
  }
}

final _speakerListColors = <Color>[
  FlutterLatamColors.green,
  FlutterLatamColors.red,
  FlutterLatamColors.blue,
  FlutterLatamColors.red,
  FlutterLatamColors.blue,
  FlutterLatamColors.yellow,
  FlutterLatamColors.red,
  FlutterLatamColors.green,
  FlutterLatamColors.blue,
  FlutterLatamColors.green,
  FlutterLatamColors.red,
  FlutterLatamColors.blue,
  FlutterLatamColors.yellow,
  FlutterLatamColors.blue,
  FlutterLatamColors.green,
];

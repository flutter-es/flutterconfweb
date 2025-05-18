import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/button/fcl_button.dart';
import 'package:flutter_conf_latam/core/widgets/card/grid_card_item.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/adaptable_text.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeFeatures extends ConsumerWidget {
  const HomeFeatures({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final features = <({String title, String description, String image})>[
      (
        title: l10n.homeFeatureLearnTitle,
        description: l10n.homeFeatureLearnDescription,
        image: Assets.images.features.one,
      ),
      (
        title: l10n.homeFeatureConnectTitle,
        description: l10n.homeFeatureConnectDescription,
        image: Assets.images.features.two,
      ),
      (
        title: l10n.homeFeatureGrowthTitle,
        description: l10n.homeFeatureGrowthDescription,
        image: Assets.images.features.three,
      ),
      (
        title: l10n.homeFeaturePrizeTitle,
        description: l10n.homeFeaturePrizeDescription,
        image: Assets.images.features.four,
      ),
    ];

    return SectionContainer(
      spacing: 30,
      children: <Widget>[
        TitleSubtitleText(
          title: (
            text: l10n.homeFeatureTitle,
            size: switch (context.screenSize) {
              ScreenSize.extraLarge => 64,
              ScreenSize.large => 48,
              ScreenSize.normal || ScreenSize.small => 24,
            },
          ),
          subtitle: (
            text: l10n.homeFeatureDescription,
            size: switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => 24,
              ScreenSize.normal || ScreenSize.small => 16,
            },
          ),
          spacing: 12,
        ),
        Flex(
          spacing: 30,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: switch (context.screenSize) {
            ScreenSize.extraLarge => Axis.horizontal,
            _ => Axis.vertical,
          },
          children: <Widget>[
            Flexible(
              flex: 2,
              child: ResponsiveGrid(
                columnSizes: switch (context.screenSize) {
                  ScreenSize.extraLarge || ScreenSize.large => 2,
                  ScreenSize.normal || ScreenSize.small => 1,
                },
                rowSizes: switch (context.screenSize) {
                  ScreenSize.extraLarge || ScreenSize.large => 2,
                  ScreenSize.normal || ScreenSize.small => features.length,
                },
                children: <Widget>[
                  for (final item in features)
                    GridCardItem(
                      title: item.title,
                      description: item.description,
                      imagePath: item.image,
                    ),
                ],
              ),
            ),
            const Flexible(
              child: SizedBox(
                width: double.infinity,
                child: _BuyTicketFeature(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BuyTicketFeature extends ConsumerWidget {
  const _BuyTicketFeature();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final config = ref.watch(configProvider);

    final children = <Widget>[
      Align(
        child: SizedBox.square(
          dimension: 150,
          child: Image.asset(Assets.images.features.tickets),
        ),
      ),
      Column(
        spacing: 30,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AdaptableText(
            l10n.homeFeatureBuyTicketTitle(100),
            textAlign: switch (context.screenSize) {
              ScreenSize.small || ScreenSize.normal => TextAlign.center,
              _ => TextAlign.start,
            },
            style: const TextStyle(
              fontFamily: 'Recoleta',
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: FlutterLatamColors.white,
            ),
          ),
          Align(
            alignment: switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => Alignment.centerLeft,
              ScreenSize.normal || ScreenSize.small => Alignment.center,
            },
            child: FclButton.secondary(
              label: l10n.homeFeatureBuyTicketButton,
              onPressed: () => Utils.launchUrlLink(config.ticketPageUrl),
            ),
          ),
        ],
      ),
    ];

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterLatamColors.blue,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: switch (context.screenSize) {
          ScreenSize.large => Row(
            spacing: 30,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (final (index, item) in children.indexed)
                Expanded(flex: index == 0 ? 1 : 2, child: item),
            ],
          ),
          _ => Column(
            spacing: 30,
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        },
      ),
    );
  }
}

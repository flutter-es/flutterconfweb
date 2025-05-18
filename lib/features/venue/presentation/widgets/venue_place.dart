import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/card/grid_card_item.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VenuePlace extends ConsumerWidget {
  const VenuePlace({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final about = <({String title, String description, String image})>[
      (
        title: l10n.aboutPlaceInstallationTitle,
        description: l10n.aboutPlaceInstallationDescription,
        image: Assets.images.about.university,
      ),
      (
        title: l10n.aboutPlaceFoodTitle,
        description: l10n.aboutPlaceFoodDescription,
        image: Assets.images.about.food,
      ),
      (
        title: l10n.aboutPlaceMoveTitle,
        description: l10n.aboutPlaceMoveDescription,
        image: Assets.images.about.map,
      ),
    ];

    return SectionContainer(
      spacing: 30,
      children: <Widget>[
        TitleSubtitleText(
          title: (
            text: l10n.aboutPlaceTitle,
            size: switch (context.screenSize) {
              ScreenSize.extraLarge => 64,
              ScreenSize.large => 48,
              ScreenSize.normal || ScreenSize.small => 24,
            },
          ),
          subtitle: (
            text: l10n.aboutPlaceDescription,
            size: switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => 24,
              ScreenSize.normal || ScreenSize.small => 16,
            },
          ),
          spacing: 12,
        ),
        ResponsiveGrid(
          columnSizes: switch (context.screenSize) {
            ScreenSize.extraLarge => 3,
            _ => 1,
          },
          rowSizes: switch (context.screenSize) {
            ScreenSize.extraLarge => 2,
            _ => about.length,
          },
          children: <Widget>[
            for (final item in about)
              GridCardItem(
                title: item.title,
                description: item.description,
                imagePath: item.image,
              ),
          ],
        ),
      ],
    );
  }
}

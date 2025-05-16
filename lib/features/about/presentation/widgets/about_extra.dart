import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/card/grid_card_item.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import AppLocalizations
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutExtra extends ConsumerWidget {
  const AboutExtra({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    final about = <({String title, String description, String image})>[
      (
        title: l10n?.safety ?? '',
        description: l10n?.safetyDesc ?? '',
        image: Assets.images.features.security,
      ),
      (
        title: l10n?.emergency ?? '',
        description: l10n?.emergencyDesc ?? '',
        image: Assets.images.features.phone,
      ),
      (
        title: l10n?.taxi ?? '',
        description: l10n?.taxiDesc ?? '',
        image: Assets.images.features.taxi,
      ),
      (
        title: l10n?.deliveryApp ?? '',
        description: l10n?.deliveryAppDesc ?? '',
        image: Assets.images.features.delivery,
      ),
    ];

    return SectionContainer(
      spacing: 30,
      children: <Widget>[
        TitleSubtitleText(
          title: (
            text: l10n?.contactExtraInfo ?? '',
            size: switch (context.screenSize) {
              ScreenSize.extraLarge => 64,
              ScreenSize.large => 48,
              ScreenSize.normal || ScreenSize.small => 24,
            },
          ),
          subtitle: (
            text: l10n?.contactExtraInfoDesc ?? '',
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
                  ScreenSize.normal || ScreenSize.small => about.length,
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
            ),
          ],
        ),
      ],
    );
  }
}

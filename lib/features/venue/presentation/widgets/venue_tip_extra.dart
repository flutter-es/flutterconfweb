import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/card/grid_card_item.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VenueTipExtra extends ConsumerWidget {
  const VenueTipExtra({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);

    final about = <VenueTipItem>[
      VenueTipItem(
        title: l10n.aboutExtraSafetyTitle,
        description: l10n.aboutExtraSafetyDescription,
        image: Assets.images.about.security,
      ),
      VenueTipItem(
        title: l10n.aboutExtraTransportTitle,
        description: l10n.aboutExtraTransportDescription,
        image: Assets.images.about.taxi,
      ),
      VenueTipItem(
        title: l10n.aboutExtraDeliveryAppTitle,
        description: l10n.aboutExtraDeliveryAppDescription,
        image: Assets.images.about.delivery,
      ),
    ];

    return SectionContainer(
      spacing: 30,
      children: <Widget>[
        TitleSubtitleText(
          title: (
            text: l10n.aboutExtraInfoTitle,
            size: switch (context.screenSize) {
              .extraLarge => 64,
              .large => 48,
              .normal || .small => 24,
            },
          ),
          subtitle: (
            text: l10n.aboutExtraInfoDescription,
            size: switch (context.screenSize) {
              .extraLarge || .large => 24,
              .normal || .small => 16,
            },
          ),
          spacing: 12,
        ),
        ResponsiveGrid(
          columnSizes: switch (context.screenSize) {
            .extraLarge => 3,
            _ => 1,
          },
          rowSizes: switch (context.screenSize) {
            .extraLarge => 2,
            _ => about.length,
          },
          children: <Widget>[
            for (final item in about)
              GridCardItem(
                title: item.title,
                description: item.description,
                imagePath: item.image,
                url: item.url,
              ),
          ],
        ),
      ],
    );
  }
}

class VenueTipItem {
  VenueTipItem({
    required this.title,
    required this.description,
    required this.image,
    this.url,
  });

  final String title;
  final String description;
  final String image;
  final ({String url, String text})? url;
}

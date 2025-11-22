import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/button/fcl_button.dart';
import 'package:flutter_conf_latam/core/widgets/container/keep_alive_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/images/carousel_images.dart';
import 'package:flutter_conf_latam/core/widgets/text/adaptable_text.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VenueMain extends ConsumerWidget {
  const VenueMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final config = ref.watch(configProvider);

    final theme = context.theme.fclThemeScheme;

    final carouselImageUrls = <String>[
      Assets.images.venue.one,
      Assets.images.venue.two,
      Assets.images.venue.three,
    ];

    final venueInfoList = <({String text, String icon})>[
      (text: l10n.aboutVenueAddress, icon: Assets.images.icons.pinMap),
      (text: l10n.aboutVenueCapacity, icon: Assets.images.icons.people),
    ];

    return KeepAliveContainer(
      child: SectionContainer(
        spacing: 48,
        children: <Widget>[
          CarouselImages(images: carouselImageUrls),
          Column(
            spacing: 24,
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: <Widget>[
              TitleSubtitleText(
                title: (
                  text: l10n.aboutVenueName,
                  size: switch (context.screenSize) {
                    .extraLarge => 64,
                    .large => 48,
                    .normal || .small => 24,
                  },
                ),
                subtitle: (
                  text: l10n.aboutVenueDescription,
                  size: switch (context.screenSize) {
                    .extraLarge || .large => 24,
                    .normal || .small => 16,
                  },
                ),
                textAlign: .start,
              ),
              Flex(
                spacing: 24,
                crossAxisAlignment: switch (context.screenSize) {
                  .extraLarge => .center,
                  _ => .start,
                },
                mainAxisAlignment: .spaceBetween,
                direction: switch (context.screenSize) {
                  .extraLarge => .horizontal,
                  _ => .vertical,
                },
                children: <Widget>[
                  Column(
                    spacing: 16,
                    mainAxisSize: .min,
                    crossAxisAlignment: .start,
                    children: <Widget>[
                      for (final item in venueInfoList)
                        Row(
                          spacing: 10,
                          mainAxisSize: .min,
                          children: <Widget>[
                            SizedBox.square(
                              dimension: switch (context.screenSize) {
                                .extraLarge || .large => 32,
                                .normal || .small => 24,
                              },
                              child: SvgPicture.asset(item.icon),
                            ),
                            AdaptableText(
                              item.text,
                              style: switch (context.screenSize) {
                                .extraLarge ||
                                .large => theme.typography.body1Regular,
                                .normal ||
                                .small => theme.typography.body3Regular,
                              },
                            ),
                          ],
                        ),
                    ],
                  ),
                  FclButton.primary(
                    label: l10n.aboutVenueHowToArrive,
                    buttonSize: switch (context.screenSize) {
                      .normal || .small => .small,
                      _ => .large,
                    },
                    icon: SizedBox.square(
                      dimension: switch (context.screenSize) {
                        .extraLarge || .large => 24,
                        .normal || .small => 20,
                      },
                      child: SvgPicture.asset(Assets.images.icons.arrowCurve),
                    ),
                    onPressed: () => Utils.launchUrlLink(config.venueMapUrl),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

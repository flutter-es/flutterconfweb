import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/container/card_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeVenue extends ConsumerWidget {
  const HomeVenue({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final theme = context.theme.fclThemeScheme;

    return SectionContainer(
      children: <Widget>[
        CardContainer(
          borderColor: FlutterLatamColors.red,
          child: Column(
            spacing: 30,
            mainAxisSize: .min,
            children: <Widget>[
              Text(
                l10n.homeVenueGratitudeMessage,
                textAlign: .center,
                style: switch (context.screenSize) {
                  .extraLarge => theme.typography.body1Regular,
                  _ => theme.typography.body3Regular,
                },
              ),
              SizedBox.fromSize(
                size: switch (context.screenSize) {
                  .extraLarge => const Size(576, 192),
                  .large => const Size(384, 128),
                  _ => const Size(216, 72),
                },
                child: Image.asset(
                  Assets.images.sponsors.venueLogo,
                  semanticLabel: l10n.homeVenueGratitudeName,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

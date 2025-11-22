import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/container/card_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/features/home/domain/models/sponsors/sponsor_model.dart';
import 'package:flutter_conf_latam/features/home/presentation/view_model/home_view_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef SponsorLevelList = ({List<SponsorModel> sponsors, SponsorLevel level});

class HomeSponsors extends ConsumerWidget {
  const HomeSponsors({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final sponsors = ref.watch(sponsorsProvider);

    return sponsors.maybeWhen(
      data: (data) {
        final sponsorsLevelList = <SponsorLevelList>[
          (
            sponsors: data.where((item) => item.isPlatinum).toList(),
            level: .platinum,
          ),
          (
            sponsors: data.where((item) => item.isGold).toList(),
            level: .gold,
          ),
          (
            sponsors: data.where((item) => item.isSilver).toList(),
            level: .silver,
          ),
          (
            sponsors: data.where((item) => item.isBronze).toList(),
            level: .bronze,
          ),
          (
            sponsors: data.where((item) => item.isInKind).toList(),
            level: .inKind,
          ),
          (
            sponsors: data.where((item) => item.isSenior).toList(),
            level: .senior,
          ),
          (
            sponsors: data.where((item) => item.isJunior).toList(),
            level: .junior,
          ),
        ];

        return SectionContainer(
          spacing: 30,
          children: <Widget>[
            TitleSubtitleText(
              title: (
                text: l10n.homeSponsorsTitle,
                size: switch (context.screenSize) {
                  .extraLarge => 64,
                  .large => 48,
                  .normal || .small => 24,
                },
              ),
              subtitle: (
                text: l10n.homeSponsorsMessage,
                size: switch (context.screenSize) {
                  .extraLarge || .large => 24,
                  .normal || .small => 16,
                },
              ),
              spacing: 12,
            ),
            Column(
              spacing: 30,
              mainAxisSize: .min,
              children: <Widget>[
                for (final item in sponsorsLevelList)
                  if (item.sponsors.isNotEmpty)
                    _SponsorCardContainer(
                      sponsors: item.sponsors,
                      level: item.level,
                    ),
              ],
            ),
          ],
        );
      },
      orElse: Offstage.new,
    );
  }
}

class _SponsorCardContainer extends StatelessWidget {
  const _SponsorCardContainer({required this.sponsors, required this.level});

  final List<SponsorModel> sponsors;
  final SponsorLevel level;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.fclThemeScheme;

    return CardContainer(
      borderColor: switch (level) {
        .platinum => FlutterLatamColors.blue,
        .gold => FlutterLatamColors.yellow,
        .silver => FlutterLatamColors.green,
        .bronze => FlutterLatamColors.bronze,
        .inKind => FlutterLatamColors.purple,
        .senior => FlutterLatamColors.lightBlue,
        .junior => FlutterLatamColors.lightYellow,
      },
      child: Column(
        spacing: 30,
        mainAxisSize: .min,
        children: <Widget>[
          Consumer(
            builder: (_, ref, _) {
              final l10n = ref.watch(appLocalizationsProvider);

              return Text(
                switch (level) {
                  .platinum => l10n.homeSponsorPlatinum,
                  .gold => l10n.homeSponsorGold,
                  .silver => l10n.homeSponsorSilver,
                  .bronze => l10n.homeSponsorsBronze,
                  .inKind => l10n.homeSponsorInKind,
                  .senior => l10n.homeSponsorSenior,
                  .junior => l10n.homeSponsorJunior,
                },
                style: theme.typography.subH2Semibold.copyWith(
                  fontSize: switch (context.screenSize) {
                    .extraLarge => 32,
                    _ => 24,
                  },
                ),
              );
            },
          ),
          if (sponsors.length == 1)
            _SponsorItem(item: sponsors.first)
          else
            ResponsiveGrid(
              columnSizes: switch (context.screenSize) {
                .extraLarge || .large => sponsors.length,
                _ => 1,
              },
              rowSizes: sponsors.length,
              children: <Widget>[
                for (final item in sponsors) _SponsorItem(item: item),
              ],
            ),
        ],
      ),
    );
  }
}

class _SponsorItem extends StatelessWidget {
  const _SponsorItem({required this.item});

  final SponsorModel item;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => Utils.launchUrlLink(item.url),
        child: SizedBox.fromSize(
          size: switch (context.screenSize) {
            .extraLarge => const .fromHeight(100),
            _ => const .fromHeight(60),
          },
          child: SvgPicture.network(item.logo, semanticsLabel: item.name),
        ),
      ),
    );
  }
}

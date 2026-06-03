import 'package:flutter/material.dart';
import 'package:flutter_conf_core/flutter_conf_core.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/container/card_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/features/home/presentation/view_model/home_view_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signals/signals_flutter.dart';

typedef SponsorTierList = ({List<SponsorEntity> sponsors, SponsorsTier tier});

class HomeSponsors extends SignalWidget {
  const HomeSponsors({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = appLocalizations.value;
    final sponsors = sponsorsSignal.value;

    return sponsors.maybeMap(
      data: (data) {
        final sponsorsTierList = <SponsorTierList>[
          (
            sponsors: data.where((item) => item.tier == .platinum).toList(),
            tier: .platinum,
          ),
          (
            sponsors: data.where((item) => item.tier == .gold).toList(),
            tier: .gold,
          ),
          (
            sponsors: data.where((item) => item.tier == .silver).toList(),
            tier: .silver,
          ),
          (
            sponsors: data.where((item) => item.tier == .bronze).toList(),
            tier: .bronze,
          ),
          (
            sponsors: data.where((item) => item.tier == .inKind).toList(),
            tier: .inKind,
          ),
          (
            sponsors: data.where((item) => item.tier == .senior).toList(),
            tier: .senior,
          ),
          (
            sponsors: data.where((item) => item.tier == .junior).toList(),
            tier: .junior,
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
                for (final item in sponsorsTierList)
                  if (item.sponsors.isNotEmpty)
                    _SponsorCardContainer(
                      sponsors: item.sponsors,
                      tier: item.tier,
                    ),
              ],
            ),
          ],
        );
      },
      orElse: () => const Offstage(),
    );
  }
}

class _SponsorCardContainer extends SignalWidget {
  const _SponsorCardContainer({required this.sponsors, required this.tier});

  final List<SponsorEntity> sponsors;
  final SponsorsTier tier;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.fclThemeScheme;
    final l10n = appLocalizations.value;

    return CardContainer(
      borderColor: switch (tier) {
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
          Text(
            switch (tier) {
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

  final SponsorEntity item;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => Utils.launchUrlLink(item.websiteUrl ?? ''),
        child: SizedBox.fromSize(
          size: switch (context.screenSize) {
            .extraLarge => const .fromHeight(100),
            _ => const .fromHeight(60),
          },
          child: SvgPicture.network(item.logoUrl, semanticsLabel: item.name),
        ),
      ),
    );
  }
}

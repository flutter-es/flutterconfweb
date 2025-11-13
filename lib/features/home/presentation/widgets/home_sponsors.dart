import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/container/card_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/features/home/domain/models/sponsors/sponsor_model.dart';
import 'package:flutter_conf_latam/features/home/presentation/view_model/home_view_model.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_collaborations.dart';
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
            level: SponsorLevel.platinum,
          ),
          (
            sponsors: data.where((item) => item.isGold).toList(),
            level: SponsorLevel.gold,
          ),
          (
            sponsors: data.where((item) => item.isSilver).toList(),
            level: SponsorLevel.silver,
          ),
          (
            sponsors: data.where((item) => item.isBronze).toList(),
            level: SponsorLevel.bronze,
          ),
          (
            sponsors: data.where((item) => item.isInKind).toList(),
            level: SponsorLevel.inKind,
          ),
          (
            sponsors: data.where((item) => item.isSenior).toList(),
            level: SponsorLevel.senior,
          ),
          (
            sponsors: data.where((item) => item.isJunior).toList(),
            level: SponsorLevel.junior,
          ),
        ];

        return SectionContainer(
          spacing: 30,
          children: <Widget>[
            TitleSubtitleText(
              title: (
                text: l10n.homeSponsorsTitle,
                size: switch (context.screenSize) {
                  ScreenSize.extraLarge => 64,
                  ScreenSize.large => 48,
                  ScreenSize.normal || ScreenSize.small => 24,
                },
              ),
              subtitle: (
                text: l10n.homeSponsorsMessage,
                size: switch (context.screenSize) {
                  ScreenSize.extraLarge || ScreenSize.large => 24,
                  ScreenSize.normal || ScreenSize.small => 16,
                },
              ),
              spacing: 12,
            ),
            Column(
              spacing: 30,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                for (final item in sponsorsLevelList)
                  if (item.sponsors.isNotEmpty)
                    _SponsorCardContainer(
                      sponsors: item.sponsors,
                      level: item.level,
                    ),
              ],
            ),
            // TODO(FV): Temp
            const HomeCollaborations(),
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
        SponsorLevel.platinum => FlutterLatamColors.blue,
        SponsorLevel.gold => FlutterLatamColors.yellow,
        SponsorLevel.silver => FlutterLatamColors.green,
        SponsorLevel.bronze => FlutterLatamColors.bronze,
        SponsorLevel.inKind => FlutterLatamColors.purple,
        SponsorLevel.senior => FlutterLatamColors.lightBlue,
        SponsorLevel.junior => FlutterLatamColors.lightYellow,
      },
      child: Column(
        spacing: 30,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Consumer(
            builder: (_, ref, _) {
              final l10n = ref.watch(appLocalizationsProvider);

              return Text(
                switch (level) {
                  SponsorLevel.platinum => l10n.homeSponsorPlatinum,
                  SponsorLevel.gold => l10n.homeSponsorGold,
                  SponsorLevel.silver => l10n.homeSponsorSilver,
                  SponsorLevel.bronze => l10n.homeSponsorsBronze,
                  SponsorLevel.inKind => l10n.homeSponsorInKind,
                  SponsorLevel.senior => l10n.homeSponsorSenior,
                  SponsorLevel.junior => l10n.homeSponsorJunior,
                },
                style: theme.typography.subH2Semibold.copyWith(
                  fontSize: switch (context.screenSize) {
                    ScreenSize.extraLarge => 32,
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
                ScreenSize.extraLarge || ScreenSize.large => sponsors.length,
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
            ScreenSize.extraLarge => const Size.fromHeight(100),
            _ => const Size.fromHeight(60),
          },
          child: SvgPicture.network(item.logo, semanticsLabel: item.name),
        ),
      ),
    );
  }
}

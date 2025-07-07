import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/button/fcl_button.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/features/home/domain/models/tickets/tickets_model.dart';
import 'package:flutter_conf_latam/features/home/presentation/view_model/home_view_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePricing extends ConsumerWidget {
  const HomePricing({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final pricingList = ref.watch(ticketsProvider(Locale(l10n.localeName)));

    return pricingList.maybeWhen(
      data: (data) {
        return SectionContainer(
          spacing: 30,
          children: <Widget>[
            TitleSubtitleText(
              title: (
                text: l10n.homePricingTitle,
                size: switch (context.screenSize) {
                  ScreenSize.extraLarge => 64,
                  ScreenSize.large => 48,
                  ScreenSize.normal || ScreenSize.small => 24,
                },
              ),
              subtitle: (
                text: l10n.homePricingDescription,
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
                ScreenSize.extraLarge => 3,
                _ => data.length,
              },
              children: <Widget>[
                for (final item in data) _PricingCardItem(detail: item),
              ],
            ),
          ],
        );
      },
      orElse: Offstage.new,
    );
  }
}

class _PricingCardItem extends ConsumerWidget {
  const _PricingCardItem({required this.detail});

  final TicketsModel detail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.theme.fclThemeScheme;

    final l10n = ref.watch(appLocalizationsProvider);
    final config = ref.watch(configProvider);

    return Card.filled(
      margin: EdgeInsets.zero,
      color: switch (detail.type) {
        TicketType.early => FlutterLatamColors.yellow,
        TicketType.regular => FlutterLatamColors.blue,
        TicketType.late => FlutterLatamColors.red,
      },
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: switch (detail.type) {
          TicketType.early => const BorderSide(
            color: FlutterLatamColors.yellow,
            width: 4,
          ),
          _ => BorderSide.none,
        },
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 30),
            child: Center(
              child: Text(
                detail.title,
                style: theme.typography.body1Regular.copyWith(
                  color: switch (detail.type) {
                    TicketType.early => FlutterLatamColors.darkBlue,
                    _ => FlutterLatamColors.white,
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: FlutterLatamColors.darkBlue,
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  spacing: 5,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      l10n.homePricingEndDate(detail.endDate),
                      style: theme.typography.body1Regular.copyWith(
                        fontWeight: FontWeight.w700,
                        color: switch (detail.type) {
                          TicketType.early => FlutterLatamColors.lightYellow,
                          TicketType.regular => FlutterLatamColors.mediumBlue,
                          TicketType.late => FlutterLatamColors.lightRed,
                        },
                      ),
                    ),
                    Text(
                      '\$ ${detail.price.toStringAsFixed(0)}',
                      style: theme.typography.h1Bold.copyWith(
                        fontSize: switch (context.screenSize) {
                          ScreenSize.extraLarge || ScreenSize.large => 64,
                          _ => 32,
                        },
                      ),
                    ),
                    ...[
                      for (final item in detail.features)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '\u2022 ',
                              style: theme.typography.body2Regular,
                            ),
                            Expanded(
                              child: Text(
                                item,
                                style: switch (context.screenSize) {
                                  ScreenSize.extraLarge || ScreenSize.large =>
                                    theme.typography.body2Regular,
                                  ScreenSize.normal || ScreenSize.small =>
                                    theme.typography.body3Regular,
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                    if (detail.type == TicketType.regular)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: FclButton.primary(
                          label: l10n.homePricingBuyTicketsButton,
                          buttonSize: ButtonSize.small,
                          onPressed: () {
                            Utils.launchUrlLink(config.ticketPageUrl);
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

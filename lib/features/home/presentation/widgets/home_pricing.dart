import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/button/fcl_button.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/features/home/domain/models/tickets/tickets_model.dart';
import 'package:flutter_conf_latam/features/home/presentation/view_model/home_view_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePricing extends ConsumerWidget {
  const HomePricing({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final pricingList = ref.watch(ticketsProvider);

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
    final l10n = ref.watch(appLocalizationsProvider);

    return Card(
      color: switch (detail.id) {
        TicketType.early => FlutterLatamColors.yellow,
        TicketType.regular => FlutterLatamColors.blue,
        TicketType.late => FlutterLatamColors.red,
      },
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 30),
            child: Center(
              child: Text(
                detail.title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: switch (detail.id) {
                    TicketType.early => FlutterLatamColors.darkBlue,
                    _ => FlutterLatamColors.white,
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: switch (detail.id) {
              TicketType.early => const EdgeInsets.all(4),
              _ => EdgeInsets.zero,
            },
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: FlutterLatamColors.darkBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      l10n.homePricingEndDate(detail.endDate),
                      style: TextStyle(
                        fontFamily: 'Recoleta',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: switch (detail.id) {
                          TicketType.early => FlutterLatamColors.lightYellow,
                          TicketType.regular => FlutterLatamColors.mediumBlue,
                          TicketType.late => FlutterLatamColors.lightRed,
                        },
                      ),
                    ),
                    Text(
                      '\$ ${detail.price.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontFamily: 'Recoleta',
                        fontSize: switch (context.screenSize) {
                          ScreenSize.extraLarge || ScreenSize.large => 64,
                          _ => 32,
                        },
                        fontWeight: FontWeight.w700,
                        color: FlutterLatamColors.white,
                      ),
                    ),
                    ...[
                      for (final item in detail.features)
                        Row(
                          children: <Widget>[
                            const Text(
                              '\u2022 ',
                              style: TextStyle(
                                fontSize: 18,
                                color: FlutterLatamColors.white,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: switch (detail.id) {
                                    TicketType.late => FontWeight.w700,
                                    _ => FontWeight.w400,
                                  },
                                  color: FlutterLatamColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                    if (detail.id == TicketType.early)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: FclButton.primary(
                          label: l10n.homePricingBuyTicketsButton,
                          onPressed: () {},
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

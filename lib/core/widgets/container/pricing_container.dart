import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/button/fcl_button.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/dialog/data_protection_dialog.dart';
import 'package:flutter_conf_latam/core/widgets/dialog/main_dialog.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/features/pricing/domain/models/tickets/tickets_model.dart';
import 'package:flutter_conf_latam/features/pricing/presentation/view_model/pricing_view_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PricingContainer extends ConsumerWidget {
  const PricingContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final pricingList = ref.watch(pricingProvider(Locale(l10n.localeName)));

    return pricingList.maybeWhen(
      data: (data) => SectionContainer(
        spacing: 30,
        children: <Widget>[
          TitleSubtitleText(
            title: (
              text: l10n.homePricingTitle,
              size: switch (context.screenSize) {
                .extraLarge => 64,
                .large => 48,
                .normal || .small => 24,
              },
            ),
            subtitle: (
              text: l10n.homePricingDescription,
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
              .extraLarge => 3,
              _ => data.length,
            },
            children: <Widget>[
              for (final item in data) _PricingCardItem(detail: item),
            ],
          ),
        ],
      ),
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
        .early => FlutterLatamColors.yellow,
        .regular => FlutterLatamColors.blue,
        .late => FlutterLatamColors.red,
      },
      clipBehavior: .antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: .circular(20),
        side: switch (detail.type) {
          TicketType.early => const BorderSide(
            color: FlutterLatamColors.yellow,
            width: 4,
          ),
          _ => .none,
        },
      ),
      child: Column(
        mainAxisSize: .min,
        children: <Widget>[
          Padding(
            padding: const .symmetric(vertical: 28, horizontal: 30),
            child: Center(
              child: Text(
                detail.title,
                style: theme.typography.body1Regular.copyWith(
                  color: switch (detail.type) {
                    .early => FlutterLatamColors.darkBlue,
                    _ => FlutterLatamColors.white,
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            width: .infinity,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: FlutterLatamColors.darkBlue,
              ),
              child: Padding(
                padding: const .all(30),
                child: Column(
                  spacing: 5,
                  mainAxisSize: .min,
                  crossAxisAlignment: .start,
                  children: <Widget>[
                    Text(
                      l10n.homePricingEndDate(detail.endDate),
                      style: theme.typography.body1Regular.copyWith(
                        fontWeight: FontWeight.w700,
                        color: switch (detail.type) {
                          .early => FlutterLatamColors.lightYellow,
                          .regular => FlutterLatamColors.mediumBlue,
                          .late => FlutterLatamColors.lightRed,
                        },
                      ),
                    ),
                    Text(
                      '\$ ${detail.price.toStringAsFixed(0)}',
                      style: theme.typography.h1Bold.copyWith(
                        fontSize: switch (context.screenSize) {
                          .extraLarge || .large => 64,
                          _ => 32,
                        },
                      ),
                    ),
                    ...[
                      for (final item in detail.features)
                        Row(
                          mainAxisSize: .min,
                          crossAxisAlignment: .start,
                          children: <Widget>[
                            Text(
                              '\u2022 ',
                              style: theme.typography.body2Regular,
                            ),
                            Expanded(
                              child: Text(
                                item,
                                style: switch (context.screenSize) {
                                  .extraLarge ||
                                  .large => theme.typography.body2Regular,
                                  .normal ||
                                  .small => theme.typography.body3Regular,
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                    if (detail.type == .regular)
                      Padding(
                        padding: const .only(top: 20),
                        child: FclButton.primary(
                          label: l10n.homePricingBuyTicketsButton,
                          buttonSize: .small,
                          onPressed: () => _showDisclaimerDialog(
                            context,
                            config.ticketPageUrl,
                          ),
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

  Future<void> _showDisclaimerDialog(BuildContext context, String url) async {
    final result = await MainDialog.show<bool>(
      context,
      child: const DataProtectionDialog(),
    );
    if (result ?? false) unawaited(Utils.launchUrlLink(url));
  }
}

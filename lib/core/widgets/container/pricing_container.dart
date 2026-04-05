import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_conf_core/flutter_conf_core.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/button/fcl_button.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/features/pricing/presentation/view_model/pricing_view_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:signals/signals_flutter.dart';

class PricingContainer extends StatelessWidget {
  const PricingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = appLocalizations.watch(context);

    return Watch((context) {
      final pricingList = pricingSignal.value;
      return pricingList.maybeMap(
        data: (data) => SectionContainer(
          spacing: 50,
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
            if (data.length == 1)
              Center(
                child: SizedBox(
                  width: switch (context.screenSize) {
                    .extraLarge || .large => 380,
                    _ => null,
                  },
                  child: _PricingCardItem(detail: data.first),
                ),
              )
            else if (context.screenSize == .extraLarge)
              Row(
                spacing: 30,
                crossAxisAlignment: .start,
                children: <Widget>[
                  for (final item in data)
                    Expanded(child: _PricingCardItem(detail: item)),
                ],
              )
            else
              Column(
                spacing: 30,
                children: <Widget>[
                  for (final item in data) _PricingCardItem(detail: item),
                ],
              ),
          ],
        ),
        orElse: () => const Offstage(),
      );
    });
  }
}

class _PricingCardItem extends StatelessWidget {
  const _PricingCardItem({required this.detail});

  final TicketPricingEntity detail;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.fclThemeScheme;

    final l10n = appLocalizations.watch(context);
    final config = appConfig.watch(context);

    final isSpanish = l10n.localeName == 'es';
    final benefits = isSpanish ? detail.benefitsEs : detail.benefitsEn;

    final now = DateTime.now();
    final isWithinDateRange =
        !now.isBefore(detail.startDate) && !now.isAfter(detail.endDate);
    final isPastEndDate = now.isAfter(detail.endDate);

    return Card.filled(
      margin: .zero,
      color: switch (isWithinDateRange) {
        true => FlutterLatamColors.fluorescent,
        false => FlutterLatamColors.darkBlue.withValues(alpha: .6),
      },
      clipBehavior: .antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: .circular(20),
        side: switch (isWithinDateRange) {
          true => const BorderSide(
            color: FlutterLatamColors.fluorescent,
            width: 4,
          ),
          false => .none,
        },
      ),
      child: Column(
        mainAxisSize: .min,
        children: <Widget>[
          Padding(
            padding: const .symmetric(vertical: 28, horizontal: 30),
            child: Center(
              child: Text(
                detail.name,
                style: theme.typography.body1Regular.copyWith(
                  color: isWithinDateRange
                      ? FlutterLatamColors.darkBlue
                      : FlutterLatamColors.white,
                ),
              ),
            ),
          ),
          DecoratedBox(
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
                    isPastEndDate
                        ? l10n.homePricingSoldOut
                        : l10n.homePricingDateRange(
                            detail.startDate,
                            detail.endDate,
                          ),
                    style: theme.typography.h1Bold.copyWith(
                      fontSize: 24,
                      fontWeight: .w700,
                      color: switch (isWithinDateRange) {
                        true => FlutterLatamColors.fluorescent,
                        false => FlutterLatamColors.white,
                      },
                    ),
                  ),
                  Text(
                    '${detail.currency} ${detail.price.toStringAsFixed(0)}',
                    style: theme.typography.h1Bold.copyWith(
                      fontSize: switch (context.screenSize) {
                        .extraLarge || .large => 64,
                        _ => 32,
                      },
                      decoration: isPastEndDate
                          ? TextDecoration.lineThrough
                          : null,
                      decorationColor: FlutterLatamColors.white,
                    ),
                  ),
                  ...[
                    for (final item in benefits)
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
                  if (isWithinDateRange)
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
        ],
      ),
    );
  }

  void _showDisclaimerDialog(BuildContext context, String url) {
    // final result = await MainDialog.show<bool>(
    //   context,
    //   child: const DataProtectionDialog(),
    // );
    // if (result ?? false)
    unawaited(Utils.launchUrlLink(url));
  }
}

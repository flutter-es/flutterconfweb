import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/card/grid_card_item.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/features/venue/presentation/view_model/venue_view_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:signals/signals_flutter.dart';

class VenueTipExtra extends SignalWidget {
  const VenueTipExtra({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = appLocalizations.value;
    final venueState = venueSignal.value;

    return venueState.maybeMap(
      data: (venue) {
        final tips = venue.tips;
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
            if (tips.isNotEmpty)
              ResponsiveGrid(
                columnSizes: switch (context.screenSize) {
                  .extraLarge => 3,
                  _ => 1,
                },
                rowSizes: switch (context.screenSize) {
                  .extraLarge => 2,
                  _ => tips.length,
                },
                children: <Widget>[
                  for (final tip in tips)
                    GridCardItem(
                      title: tip.title,
                      description: l10n.localeName == 'es'
                          ? tip.descriptionEs
                          : tip.descriptionEn,
                      icon: switch (tip.category) {
                        .security => Icons.security,
                        .transportation => Icons.directions_bus,
                        .deliveryApps => Icons.delivery_dining,
                        .accommodation => Icons.hotel,
                        .food => Icons.restaurant,
                        .weather => Icons.cloud,
                        .currency => Icons.attach_money,
                        .language => Icons.language,
                        .emergency => Icons.emergency,
                        .other => Icons.info,
                      },
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

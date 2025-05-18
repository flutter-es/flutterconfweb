import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/button/fcl_button.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ButtonPosition { row, column }

class ExtraButtons extends ConsumerWidget {
  const ExtraButtons({required this.position, super.key});

  final ButtonPosition position;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final config = ref.watch(configProvider);

    final children = <Widget>[
      FclButton.secondary(
        label: l10n.menuBeSpeakerButton,
        onPressed: () => Utils.launchUrlLink(config.cfpFormUrl),
      ),
      FclButton.primary(
        label: l10n.menuBuyTicketsButton,
        onPressed: () => Utils.launchUrlLink(config.ticketPageUrl),
      ),
    ];

    return switch (position) {
      ButtonPosition.row => Row(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
      ButtonPosition.column => Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    };
  }
}

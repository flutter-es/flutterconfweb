import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/button/fcl_button.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum ButtonPosition { row, column }

class ExtraButtons extends ConsumerWidget {
  const ExtraButtons({required this.position, super.key});

  final ButtonPosition position;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(currentLocalizationProvider).languageCode;

    final l10n = ref.watch(appLocalizationsProvider);
    final config = ref.watch(configProvider);

    final children = <Widget>[
      FclButton.secondary(
        label: l10n.menuBeSponsorButton,
        buttonSize: .small,
        onPressed: () => _downloadFile(
          switch (language) {
            'es' => Assets.files.sponsorFileEs,
            _ => Assets.files.sponsorFileEn,
          },
          '${language.toUpperCase()}-${config.sponsorshipFileName}',
        ),
      ),
      FclButton.secondary(
        label: l10n.menuBeSpeakerButton,
        buttonSize: .small,
        onPressed: () => Utils.launchUrlLink(config.cfpFormUrl),
      ),
      FclButton.primary(
        label: l10n.menuBuyTicketsButton,
        buttonSize: .small,
        onPressed: () => _showDisclaimerDialog(context, config.ticketPageUrl),
      ),
    ];

    return switch (position) {
      .row => Row(spacing: 20, mainAxisSize: .min, children: children),
      .column => Column(spacing: 20, mainAxisSize: .min, children: children),
    };
  }

  void _showDisclaimerDialog(BuildContext context, String url) {
    // final result = await MainDialog.show<bool>(
    //   context,
    //   child: const DataProtectionDialog(),
    // );
    // if (result ?? false)
    unawaited(Utils.launchUrlLink(url));
  }

  void _downloadFile(String assetPath, String fileName) {
    unawaited(Utils.downloadPdf(assetPath, fileName));
  }
}

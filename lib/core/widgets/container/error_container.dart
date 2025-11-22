import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/button/fcl_button.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorContainer extends ConsumerWidget {
  const ErrorContainer({required this.onRetry, super.key});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);

    return Column(
      spacing: 40,
      mainAxisSize: .min,
      children: <Widget>[
        TitleSubtitleText(
          spacing: 20,
          title: (
            text: l10n.errorDataTitle,
            size: switch (context.screenSize) {
              .extraLarge => 48,
              .large => 32,
              .normal || ScreenSize.small => 16,
            },
          ),
          subtitle: (
            text: l10n.errorDataMessage,
            size: switch (context.screenSize) {
              .extraLarge || .large => 20,
              .normal || .small => 12,
            },
          ),
          textAlign: .start,
        ),
        FclButton.primary(
          label: l10n.errorDataRetryButton,
          buttonSize: .small,
          onPressed: onRetry,
        ),
      ],
    );
  }
}

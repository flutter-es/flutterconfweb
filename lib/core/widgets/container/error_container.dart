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
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TitleSubtitleText(
          spacing: 20,
          title: (
            text: l10n.errorDataTitle,
            size: switch (context.screenSize) {
              ScreenSize.extraLarge => 48,
              ScreenSize.large => 32,
              ScreenSize.normal || ScreenSize.small => 16,
            },
          ),
          subtitle: (
            text: l10n.errorDataMessage,
            size: switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => 20,
              ScreenSize.normal || ScreenSize.small => 12,
            },
          ),
          textAlign: TextAlign.start,
        ),
        FclButton.primary(
          label: l10n.errorDataRetryButton,
          buttonSize: ButtonSize.small,
          onPressed: onRetry,
        ),
      ],
    );
  }
}

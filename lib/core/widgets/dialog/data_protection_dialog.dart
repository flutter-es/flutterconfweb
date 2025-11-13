import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/button/fcl_button.dart';
import 'package:flutter_conf_latam/core/widgets/container/dialog_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/data_protection_text.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DataProtectionDialog extends ConsumerWidget {
  const DataProtectionDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final theme = context.theme.fclThemeScheme;

    final paddingTop = switch (context.screenSize) {
      ScreenSize.extraLarge || ScreenSize.large => 64.0,
      ScreenSize.normal || ScreenSize.small => 60.0,
    };

    final dialogMessageStyle = switch (context.screenSize) {
      ScreenSize.extraLarge ||
      ScreenSize.large => theme.typography.body2Regular,
      ScreenSize.normal || ScreenSize.small => theme.typography.body3Regular,
    };

    return SafeArea(
      bottom: false,
      child: DialogContainer(
        child: Padding(
          padding: EdgeInsets.fromLTRB(36, paddingTop, 36, 42),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: switch (context.screenSize) {
                ScreenSize.extraLarge || ScreenSize.large => 26,
                ScreenSize.normal || ScreenSize.small => 20,
              },
              children: <Widget>[
                Text(
                  l10n.dataProtectionDialogTitle,
                  style: switch (context.screenSize) {
                    ScreenSize.extraLarge ||
                    ScreenSize.large => theme.typography.h4Bold,
                    ScreenSize.normal ||
                    ScreenSize.small => theme.typography.subH2Semibold,
                  },
                ),
                const DataProtectionText(),
                Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      TextSpan(text: l10n.dataProtectionDialogButtonMessageOne),
                      TextSpan(
                        text: l10n.dataProtectionDialogButtonMessageBold,
                        style: dialogMessageStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: l10n.dataProtectionDialogButtonMessageTwo),
                    ],
                  ),
                  style: dialogMessageStyle,
                ),
                FclButton.primary(
                  label: l10n.dataProtectionDialogAcceptButton,
                  buttonSize: ButtonSize.small,
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

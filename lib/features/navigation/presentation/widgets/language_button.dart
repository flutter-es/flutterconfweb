import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/responsiveness/navigation_responsive_config.dart';
import 'package:flutter_conf_latam/l10n/generated/app_localizations.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/l10n/support_locale.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageButton extends ConsumerWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageCode = ref.watch(currentLocalizationProvider).languageCode;
    final uiConfig = NavigationResponsiveConfig.getNavigationConfig(context);

    return Container(
      height: 50,
      width: uiConfig.languageButtonWidth,
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: FlutterLatamColors.lightBlue,
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: Stack(
        children: <Widget>[
          FractionallySizedBox(
            widthFactor: 0.5,
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: FlutterLatamColors.darkBlue,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ).animate().slideX(
            begin: languageCode == SupportLocale.en.languageCode ? 1 : 0,
            end: languageCode == SupportLocale.en.languageCode ? 0 : 1,
            duration: 1.seconds,
          ),
          Row(
            children: <Widget>[
              for (final local in AppLocalizations.supportedLocales)
                Expanded(
                  child: _LanguageItem(
                    title: local.languageCode,
                    isActive: languageCode == local.languageCode,
                    onTap: () {
                      ref.read(currentLocalizationProvider.notifier).state =
                          local;
                    },
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LanguageItem extends StatelessWidget {
  const _LanguageItem({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  final String title;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: InkWell(
          onTap: onTap,
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: switch (isActive) {
                true => FlutterLatamColors.white,
                false => FlutterLatamColors.darkBlue,
              },
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/responsiveness/navigation_responsive_config.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/widgets/language_item.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/l10n/support_locale.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageButton extends ConsumerWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(currentLocalizationProvider);
    const locals = AppLocalizations.supportedLocales;
    final uiConfig = NavigationResponsiveConfig.getNavigationConfig(context);

    return Container(
      margin: const EdgeInsets.all(10),
      width: uiConfig.languageButtonWidth,
      height: 50,
      decoration: const BoxDecoration(
        color: Color(0xffCBECFF),
        borderRadius: BorderRadius.all(
          Radius.circular(60.0),
        ),
      ),
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: 0.5,
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: FlutterLatamColors.darkBlue,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ).animate()
          .slideX(
            begin: state.languageCode == SupportLocale.en.languageCode ? 1 : 0,
            end: state.languageCode == SupportLocale.en.languageCode ? 0 : 1,
            duration: 0.seconds,
          ),
          Center(
            child: Row(
              children: [
                for (final local in locals)
                  Expanded(
                    child: LanguageItem(
                      locale: local,
                      title: local.languageCode,
                      isActive: state.languageCode == local.languageCode,
                      onTap: (Locale selectedLocale) {
                        ref.read(currentLocalizationProvider.notifier).state =
                            selectedLocale;
                      },
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

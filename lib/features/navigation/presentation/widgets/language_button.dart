import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/widgets/language_item.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/l10n/support_locale.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageButton extends ConsumerWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(currentLocalizationProvider.notifier).state;
    final locals = AppLocalizations.supportedLocales;

    print('state ${state.languageCode}');

    return Container(
      width: 300.0,
      height: 60.0,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xffCBECFF),
        borderRadius: BorderRadius.all(
          Radius.circular(60.0),
        ),
      ),
      child: Row(
        children: [
          for (final local in locals)
            Expanded(
              child: LanguageItem(
                title: state.languageCode,
                isActive: state.languageCode == local.languageCode,
                onTap: () {
                  ref.read(currentLocalizationProvider.notifier).state =
                      SupportLocale.es;
                },
              ),
            ),
        ],
      ),
    );
  }
}

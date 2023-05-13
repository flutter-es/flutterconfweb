import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/l10n/support_locale.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: FlutterConf(),
    ),
  );
}

class FlutterConf extends ConsumerWidget {

  // void changeLanguage(Locale newLocal) {
  //   setState(() {
  //     _locale = newLocal;
  //   });
  //   ref.read(changedLocalizationProvider.notifier).state = newLocal;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appLocale = ref.watch(currentLocalizationProvider);

    return MaterialApp(
      title: 'Flutter Conf LATAM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      locale: appLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        ...AppLocalizations.localizationsDelegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}

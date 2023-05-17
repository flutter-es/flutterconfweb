import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());

  runApp(
    const ProviderScope(
      child: FlutterConf(),
    ),
  );
}

class FlutterConf extends ConsumerWidget {
  const FlutterConf({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocale = ref.watch(currentLocalizationProvider);

    return MaterialApp(
      title: 'Flutter Conf LATAM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
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

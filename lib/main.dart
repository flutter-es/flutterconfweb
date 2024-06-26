// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:intl/date_symbol_data_local.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/firebase_options.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/routes/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {

  initializeDateFormatting('es_CO');
  tz.initializeTimeZones();
  WidgetsFlutterBinding.ensureInitialized();

  //usePathUrlStrategy();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      child: FlutterConf(),
    ),
  );
}

class FlutterConf extends ConsumerWidget {
  FlutterConf({super.key}) {
    analytics.logAppOpen();

    final initTime = js.context['initTime'] as int;

    final currentTime = DateTime.now().millisecondsSinceEpoch;

    final diff = (currentTime - initTime) / 1000;

    print('diff $diff');
    analytics.logEvent(
      name: 'render_time',
      parameters: {
        'diff': diff,
      },
    );
  }

  final analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocale = ref.watch(currentLocalizationProvider);

    return MaterialApp.router(
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
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routerDelegate: AppRoutes.router.routerDelegate,
    );
  }
}

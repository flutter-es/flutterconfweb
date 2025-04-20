import 'dart:js_interop';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/l10n/generated/app_localizations.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@JS('window')
external JSWindow get window;

extension type JSWindow._(JSObject _) implements JSObject {
  external int get initTime;
}

class FlutterConfApp extends ConsumerWidget {
  FlutterConfApp({super.key}) {
    analytics.logAppOpen();

    final initTime = window.initTime;
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    final diff = (currentTime - initTime) / 1000;
    analytics.logEvent(name: 'render_time', parameters: {'diff': diff});
  }

  final analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocale = ref.watch(currentLocalizationProvider);

    return MaterialApp.router(
      title: 'Flutter Conf LATAM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
      ),
      locale: appLocale,
      routerConfig: AppRoutes.router,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}

import 'dart:async';
import 'dart:js_interop';
import 'dart:ui';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/routes/app_routes.dart';
import 'package:flutter_conf_latam/l10n/gen/app_localizations.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:signals/signals_flutter.dart';

@JS('window')
external JSWindow get window;

extension type JSWindow._(JSObject _) implements JSObject {
  external int get initTime;
}

class FlutterConfApp extends StatefulWidget {
  const FlutterConfApp({super.key});

  @override
  State<FlutterConfApp> createState() => _FlutterConfAppState();
}

class _FlutterConfAppState extends State<FlutterConfApp> {
  final _appRoutes = AppRoutes();
  final _analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    unawaited(_analytics.logAppOpen());

    final initTime = window.initTime;
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    final diff = (currentTime - initTime) / 1000;
    unawaited(
      _analytics.logEvent(name: 'render_time', parameters: {'diff': diff}),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = currentLocale.watch(context);

    return MaterialApp.router(
      title: 'Flutter Conf LATAM',
      debugShowCheckedModeBanner: false,
      theme: FclTheme.light(),
      locale: appLocale,
      routerConfig: _appRoutes.router,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
    );
  }
}

import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/features/shared/providers/shared_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
  FirebaseOptions options,
) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async {
      usePathUrlStrategy();

      await initializeDateFormatting('es_CO');
      tz.initializeTimeZones();

      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(options: options);

      runApp(
        ProviderScope(
          overrides: [
            sharedPrefsInstanceProvider.overrideWithValue(
              await SharedPreferences.getInstance(),
            ),
          ],
          child: await builder(),
        ),
      );
    },
    (error, stack) {
      if (kDebugMode) log(error.toString(), stackTrace: stack);
    },
  );
}

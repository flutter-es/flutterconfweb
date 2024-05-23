import 'dart:async';
import 'package:flutter_conf_colombia/features/shared/providers/shared_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebLocalStorageService {
  WebLocalStorageService(this.ref);

  final Ref ref;

  static const String menuSelection = 'menuSelection';
  late SharedPreferences prefs;

  Future<bool> initLocalStorage() {
    var localStorageCompleter = Completer<bool>();

    ref.read(sharedPrefsInstanceProvider).then((sp) {
      prefs = sp;
      localStorageCompleter.complete(true);
    });

    return localStorageCompleter.future;
  }

  void storeSelectedNav(String route) {
    prefs.setString(WebLocalStorageService.menuSelection, route);
  }

  String getSelectedNav() {
    return prefs.getString(WebLocalStorageService.menuSelection) ?? '';
  }
}

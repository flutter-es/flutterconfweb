import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_conf_latam/core/config/config.dart';
import 'package:flutter_conf_latam/core/services/web_local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals.dart';

final firebaseFirestore = signal(FirebaseFirestore.instance);
final firebaseFunctions = signal(FirebaseFunctions.instance);

late final Signal<SharedPreferences> sharedPrefsInstance;

void initSharedPreferences(SharedPreferences prefs) {
  sharedPrefsInstance = signal(prefs);
}

final webLocalStorage = computed(() {
  return WebLocalStorageService(preferences: sharedPrefsInstance.value);
});

final appConfig = signal(Config());

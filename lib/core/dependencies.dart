import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_conf_latam/core/config/config.dart';
import 'package:flutter_conf_latam/core/services/web_local_storage_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final firebaseFirestoreProvider = Provider((_) => FirebaseFirestore.instance);

final sharedPrefsInstanceProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('You must implement shared preferences');
});

final webLocalStorageProvider = Provider((ref) {
  return WebLocalStorageService(
    preferences: ref.watch(sharedPrefsInstanceProvider),
  );
});

final configProvider = Provider((ref) => Config());

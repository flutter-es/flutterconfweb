import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_conf_latam/services/weblocalstorage.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefsInstanceProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('You must implement shared preferences');
});

final dbProvider = Provider((_) => FirebaseFirestore.instance);

final webLocalStorageProvider = Provider((ref) {
  return WebLocalStorageService(
    preferences: ref.watch(sharedPrefsInstanceProvider),
  );
});

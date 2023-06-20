import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_conf_colombia/services/weblocalstorage.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefsInstanceProvider = Provider((ref) {
  return SharedPreferences.getInstance();
});

final dbProvider = Provider((ref) {
  return FirebaseFirestore.instance;
});

final webLocalStorageProvider = Provider((ref) {
  return WebLocalStorageService(ref);
});
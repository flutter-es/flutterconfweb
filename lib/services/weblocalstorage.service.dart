import 'package:shared_preferences/shared_preferences.dart';

class WebLocalStorageService {
  WebLocalStorageService({required this.preferences});

  final SharedPreferences preferences;

  static const String _menuSelection = 'menuSelection';

  void storeSelectedNav(String route) {
    preferences.setString(WebLocalStorageService._menuSelection, route);
  }

  String getSelectedNav() {
    return preferences.getString(WebLocalStorageService._menuSelection) ?? '';
  }
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get errorPageTitle => 'Uh-oh, sorry!';

  @override
  String get errorPageSubtitle => 'It wasn\'t Dash\'s fault - I swear!';

  @override
  String get errorReturnHomeButton => 'Return Home';

  @override
  String copyright(int year) {
    return '© $year Flutter Conf Latam';
  }
}

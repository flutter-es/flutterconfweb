// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get errorPageTitle => '¡Oh, disculpa!';

  @override
  String get errorPageSubtitle => '¡No fue culpa de Dash, en serio!';

  @override
  String get errorReturnHomeButton => 'Volver al inicio';

  @override
  String copyright(int year) {
    return '© $year Flutter Conf Latam';
  }
}

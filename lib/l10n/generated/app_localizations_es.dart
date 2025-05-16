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
  String get conctacUdla => 'See you at the University of the Americas!';

  @override
  String get conctactDescription => '¡Así es! FlutterConf Latam 2025 se llevará a cabo en la Universidad de las Américas. Prepárate para vivir una experiencia única en este increíble campus.';

  @override
  String get contactCapacity => 'Capacidad: 600 personas';

  @override
  String get aboutPlace => 'Acerca del lugar';

  @override
  String get aboutDesc => 'Te dejamos tres datos clave para que te sientas cómodo y disfrutes al máximo del lugar.';

  @override
  String get aboutInstalations => 'Instalaciones del campus';

  @override
  String get aboutInstalacionsDesc => 'The facility features modern classrooms, auditoriums, and networking spaces, equipped with high-speed Wi-Fi throughout the campus.';

  @override
  String get aboutFood => 'Comida y bebidas';

  @override
  String get aboutFoodDesc => 'Hay varias cafeterías y opciones de comida disponibles en el campus, con menús especiales preparados para los asistentes de la conferencia';

  @override
  String get aboutHowMoveDesc => 'El campus es fácil de navegar con una señalización clara. Personal del evento, con camisetas azules de Flutter, estará disponible para ayudarte.';

  @override
  String get aboutHowMove => '¿Cómo moverse?';

  @override
  String get contactExtraInfo => 'Datos extras y consejos útiles';

  @override
  String get contactExtraInfoDesc => 'Te compartimos algunas recomendaciones para que aproveches al máximo el evento.';

  @override
  String get safety => 'Precauciones de seguridad';

  @override
  String get safetyDesc => 'Evita llevar grandes cantidades de dinero y mantén tus objetos de valor seguros en áreas concurridas.';

  @override
  String get emergency => 'Contactos de emergencia';

  @override
  String get emergencyDesc => 'Dial 911 for police, ambulance, or firefighters. For tourist assistance, call +593-123-AYUDA.';

  @override
  String get taxi => 'Taxis y transportes';

  @override
  String get taxiDesc => 'Usa taxis autorizados o aplicaciones como Uber y Cabify. Evita tomar taxis no registrados.';

  @override
  String get deliveryApp => 'Delivery applications';

  @override
  String get deliveryAppDesc => 'Popular options include Rappi and Uber Eats for fast and reliable service.';

  @override
  String get howToGet => '¿Cómo llegar?';

  @override
  String copyright(int year) {
    return '© $year Flutter Conf Latam';
  }
}

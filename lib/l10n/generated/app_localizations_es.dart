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
  String get aboutVenueName => '¡Nos vemos en la Universidad de las Américas!';

  @override
  String get aboutVenueDescription => '¡Así es! FlutterConf Latam 2025 se llevará a cabo en la Universidad de las Américas. Prepárate para vivir una experiencia única en este increíble campus.';

  @override
  String get aboutVenueCapacity => 'Capacidad: 600 personas';

  @override
  String get aboutVenueHowToArrive => '¿Cómo llegar?';

  @override
  String get aboutPlaceTitle => 'Acerca del lugar';

  @override
  String get aboutPlaceDescription => 'Te dejamos tres datos clave para que te sientas cómodo y disfrutes al máximo del lugar.';

  @override
  String get aboutPlaceInstallationTitle => 'Instalaciones del campus';

  @override
  String get aboutPlaceInstallationDescription => 'El lugar cuenta con aulas modernas, auditorios y espacios para networking, equipados con Wi-Fi de alta velocidad en todo el campus.';

  @override
  String get aboutPlaceFoodTitle => 'Comida y bebidas';

  @override
  String get aboutPlaceFoodDescription => 'Hay varias cafeterías y opciones de comida disponibles en el campus, con menús especiales preparados para los asistentes de la conferencia';

  @override
  String get aboutPlaceMoveTitle => '¿Cómo moverse?';

  @override
  String get aboutPlaceMoveDescription => 'El campus es fácil de navegar con una señalización clara. Personal del evento, con camisetas azules de Flutter, estará disponible para ayudarte.';

  @override
  String get aboutExtraInfoTitle => 'Datos extras y consejos útiles';

  @override
  String get aboutExtraInfoDescription => 'Te compartimos algunas recomendaciones para que aproveches al máximo el evento.';

  @override
  String get aboutExtraSafetyTitle => 'Precauciones de seguridad';

  @override
  String get aboutExtraSafetyDescription => 'Evita llevar grandes cantidades de dinero y mantén tus objetos de valor seguros en áreas concurridas.';

  @override
  String get aboutExtraEmergencyTitle => 'Contactos de emergencia';

  @override
  String get aboutExtraEmergencyDescription => 'Marca 911 para la policía, ambulancia o bomberos. Para asistencia al turista, llama al +593-123-AYUDA.';

  @override
  String get aboutExtraTransportTitle => 'Taxis y transportes';

  @override
  String get aboutExtraTransportDescription => 'Usa taxis autorizados o aplicaciones como Uber y Cabify. Evita tomar taxis no registrados.';

  @override
  String get aboutExtraDeliveryAppTitle => 'Aplicaciones de entrega';

  @override
  String get aboutExtraDeliveryAppDescription => 'Las opciones populares incluyen Rappi y Uber Eats para un servicio rápido y confiable.';

  @override
  String copyright(int year) {
    return '© $year Flutter Conf Latam - Todos los derechos reservados';
  }
}

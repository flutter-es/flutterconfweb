// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get menuVenueText => 'Venue';

  @override
  String get menuContactText => 'Contacto';

  @override
  String get menuBeSpeakerButton => 'Ser speaker';

  @override
  String get menuBuyTicketsButton => 'Comprar tickets';

  @override
  String get errorPageTitle => '¡Oh, disculpa!';

  @override
  String get errorPageSubtitle => '¡No fue culpa de Dash, en serio!';

  @override
  String get errorReturnHomeButton => 'Volver al inicio';

  @override
  String get homeMainTitle => 'FlutterConfLatam 2025\nQuito - Ecuador';

  @override
  String get homeMainDescription => '9 y 10 de Septiembre';

  @override
  String get homeMainExperienceOne =>
      '¡La experiencia Flutter te espera en la ';

  @override
  String get homeMainExperienceTwo => 'Mitad del Mundo';

  @override
  String get homeCountDownDays => 'Días';

  @override
  String get homeCountDownHours => 'Horas';

  @override
  String get homeCountDownMinutes => 'Minutos';

  @override
  String get homeCountDownSeconds => 'Segundos';

  @override
  String get homeFeatureTitle => '¿Amas Flutter?';

  @override
  String get homeFeatureDescription =>
      'Entonces no puedes perderte FlutterConf Latam 2025 el evento donde aprendes, conectas y te inspiras.';

  @override
  String get homeFeatureLearnTitle => 'Aprende con expertos';

  @override
  String get homeFeatureLearnDescription =>
      'Disfruta de charlas y workshops sobre Flutter, y más.';

  @override
  String get homeFeatureConnectTitle => 'Conecta con la comunidad';

  @override
  String get homeFeatureConnectDescription =>
      'Conecta con gente que vibra igual que tú.';

  @override
  String get homeFeatureGrowthTitle => 'Inspírate y crece';

  @override
  String get homeFeatureGrowthDescription =>
      'Descubre ideas, herramientas y nuevas perspectivas para tus proyectos.';

  @override
  String get homeFeaturePrizeTitle => 'Gana premios increíbles';

  @override
  String get homeFeaturePrizeDescription =>
      'Participa en dinámicas, retos y sorteos... ¡y gana tu propio Dash!';

  @override
  String homeFeatureBuyTicketTitle(double value) {
    return '¡Compra tu ticket desde \$$value aquí!';
  }

  @override
  String get homeFeatureBuyTicketButton => 'Comprar tickets';

  @override
  String get homeNoveltiesTitle => 'Novedades para este 2025';

  @override
  String get homeNoveltiesDescription =>
      'Siempre hemos dado lo mejor, pero ahora queremos ofrecerte una experiencia Flutter aún más completa.';

  @override
  String get homeNoveltiesMerchTitle => 'Merch edición Ecuador';

  @override
  String get homeNoveltiesMerchDescription =>
      'Swag único, stickers y más, solo para esta edición.';

  @override
  String get homeNoveltiesTriviaTitle => '¿Amante de la trivia?';

  @override
  String get homeNoveltiesTriviaDescription =>
      'Estamos preparando algo que te va a encantar.';

  @override
  String get homeNoveltiesAppTitle => '¡Este 2025 tendremos app oficial!';

  @override
  String get homeNoveltiesAppDescription =>
      'Todo lo que necesitas de FlutterConfLatam ahora en la palma de tu mano.';

  @override
  String get homeNoveltiesAppSoon => 'Proximamente:';

  @override
  String get homePricingTitle => '¡La experiencia Flutter al alcance de todos!';

  @override
  String get homePricingDescription =>
      'Aprovecha el precio early bird y asegura tu lugar';

  @override
  String homePricingEndDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat(
      'MMMM d',
      localeName,
    );
    final String dateString = dateDateFormat.format(date);

    return 'Hasta $dateString';
  }

  @override
  String get homePricingBuyTicketsButton => 'Comprar tickets';

  @override
  String get homeCollaborationTitle => '¿Quieres colaborar a otro nivel?';

  @override
  String get homeCollaborationDescription =>
      'Súmate como speaker o sponsor y forma parte del corazón de FlutterConf Latam 2025.';

  @override
  String get homeCollaborationSpeakerTitle => '¿Quieres ser speaker?';

  @override
  String get homeCollaborationSpeakerDescription =>
      'Si lo tuyo es inspirar y enseñar, súmate como speaker';

  @override
  String get homeCollaborationSpeakerButton => 'Ser speaker';

  @override
  String get homeCollaborationSponsorTitle =>
      '¿Quieres colaborar como sponsor?';

  @override
  String get homeCollaborationSponsorDescription =>
      '¡Tu marca también puede ser parte de esta gran experiencia!';

  @override
  String get homeCollaborationSponsorButton => 'Ser sponsor';

  @override
  String get homeCommunityTitle => 'Hecho con y para la comunidad';

  @override
  String get homeCommunityDescription =>
      'Este evento no sería lo mismo sin el corazón de Flutter: ¡las comunidades que lo hacen posible!';

  @override
  String get homeFaqTitle => 'Preguntas frecuentes';

  @override
  String get homeFaqDescription =>
      'Aquí respondemos las más comunes para que vivas la experiencia Flutter sin complicaciones.';

  @override
  String get aboutVenueName => '¡Nos vemos en la Universidad de las Américas!';

  @override
  String get aboutVenueDescription =>
      '¡Así es! FlutterConf Latam 2025 se llevará a cabo en la Universidad de las Américas. Prepárate para vivir una experiencia única en este increíble campus.';

  @override
  String get aboutVenueAddress => 'Vía a Nayón, Quito';

  @override
  String get aboutVenueCapacity => 'Capacidad: 600 personas';

  @override
  String get aboutVenueHowToArrive => '¿Cómo llegar?';

  @override
  String get aboutPlaceTitle => 'Acerca del lugar';

  @override
  String get aboutPlaceDescription =>
      'Te dejamos tres datos clave para que te sientas cómodo y disfrutes al máximo del lugar.';

  @override
  String get aboutPlaceInstallationTitle => 'Instalaciones del campus';

  @override
  String get aboutPlaceInstallationDescription =>
      'El lugar cuenta con aulas modernas, auditorios y espacios para networking, equipados con Wi-Fi de alta velocidad en todo el campus.';

  @override
  String get aboutPlaceFoodTitle => 'Comida y bebidas';

  @override
  String get aboutPlaceFoodDescription =>
      'Hay varias cafeterías y opciones de comida disponibles en el campus, con menús especiales preparados para los asistentes de la conferencia';

  @override
  String get aboutPlaceMoveTitle => '¿Cómo moverse?';

  @override
  String get aboutPlaceMoveDescription =>
      'El campus es fácil de navegar con una señalización clara. Personal del evento, con camisetas azules de Flutter, estará disponible para ayudarte.';

  @override
  String get aboutExtraInfoTitle => 'Datos extras y consejos útiles';

  @override
  String get aboutExtraInfoDescription =>
      'Te compartimos algunas recomendaciones para que aproveches al máximo el evento.';

  @override
  String get aboutExtraSafetyTitle => 'Precauciones de seguridad';

  @override
  String get aboutExtraSafetyDescription =>
      'Evita llevar grandes cantidades de dinero y mantén tus objetos de valor seguros en áreas concurridas.';

  @override
  String get aboutExtraEmergencyTitle => 'Contactos de emergencia';

  @override
  String get aboutExtraEmergencyDescription =>
      'Marca 911 para la policía, ambulancia o bomberos. Para asistencia al turista, llama al ';

  @override
  String get aboutExtraTransportTitle => 'Taxis y transportes';

  @override
  String get aboutExtraTransportDescription =>
      'Usa taxis autorizados o aplicaciones como Uber y/o Didi. Evita tomar taxis no registrados.';

  @override
  String get aboutExtraDeliveryAppTitle => 'Aplicaciones de entrega';

  @override
  String get aboutExtraDeliveryAppDescription =>
      'Las opciones populares incluyen Rappi y Uber Eats para un servicio rápido y confiable.';

  @override
  String get contactMainTitle => '¿Tienes dudas? Escríbenos';

  @override
  String get contactMainDescription =>
      '¡O si prefieres, contáctanos a través de nuestras redes sociales! ¡Nos encanta estar en contacto!';

  @override
  String get footerTitle => '¡Nos vemos en Quito, Ecuador 🇪🇨 !';

  @override
  String get footerDescription =>
      'Aprovecha el evento y descubre la magia de Quito y sus alrededores.';

  @override
  String get footerSeeMore => 'Saber más';

  @override
  String get footerMemoriesTitle => '¿Será tu primer FlutterConf?';

  @override
  String get footerMemoriesDescription =>
      'Mira cómo lo vivimos en ediciones anteriores.';

  @override
  String get footerMemoriesVideoOne => 'FlutterConf Latam 2024, Arequipa, Perú';

  @override
  String get footerMemoriesVideoTwo =>
      'FlutterConf Latam 2023, Medellín, Colombia';

  @override
  String copyright(int year) {
    return '© $year Flutter Conf Latam - Todos los derechos reservados';
  }
}

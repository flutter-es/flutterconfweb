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
  String get aboutVenueName => 'See you at the University of the Americas!';

  @override
  String get aboutVenueDescription => 'That\'s right! FlutterConf Latam 2025 will be held at the University of the Americas. Get ready for a unique experience on this incredible campus.';

  @override
  String get aboutVenueAddress => 'Vía a Nayón, Quito';

  @override
  String get aboutVenueCapacity => 'Capacity: 600 people';

  @override
  String get aboutVenueHowToArrive => 'How to get there?';

  @override
  String get aboutPlaceTitle => 'About the place';

  @override
  String get aboutPlaceDescription => 'We leave you three key facts so you can feel comfortable and enjoy the place to the fullest.';

  @override
  String get aboutPlaceInstallationTitle => 'Campus facilities';

  @override
  String get aboutPlaceInstallationDescription => 'The facility features modern classrooms, auditoriums, and networking spaces, equipped with high-speed Wi-Fi throughout the campus.';

  @override
  String get aboutPlaceFoodTitle => 'Food and drinks';

  @override
  String get aboutPlaceFoodDescription => 'There are several cafeterias and food options available on campus, with special menus prepared for conference attendees.';

  @override
  String get aboutPlaceMoveTitle => 'How to move?';

  @override
  String get aboutPlaceMoveDescription => 'The campus is easy to navigate with clear signage. Event staff, wearing Flutter T-shirts, will be available to assist you.';

  @override
  String get aboutExtraInfoTitle => 'Extra information and useful tips';

  @override
  String get aboutExtraInfoDescription => 'We share some recommendations so you can make the most of the event.';

  @override
  String get aboutExtraSafetyTitle => 'Safety precautions';

  @override
  String get aboutExtraSafetyDescription => 'Avoid carrying large amounts of cash and keep your valuables safe in crowded areas.';

  @override
  String get aboutExtraEmergencyTitle => 'Emergency contacts';

  @override
  String get aboutExtraEmergencyDescription => 'Dial 911 for police, ambulance, or firefighters. For tourist assistance, call +593-123-AYUDA.';

  @override
  String get aboutExtraTransportTitle => 'Taxis and transportation';

  @override
  String get aboutExtraTransportDescription => 'Use licensed taxis or apps like Uber and Cabify. Avoid unregistered taxis.';

  @override
  String get aboutExtraDeliveryAppTitle => 'Delivery applications';

  @override
  String get aboutExtraDeliveryAppDescription => 'Popular options include Rappi and Uber Eats for fast and reliable service.';

  @override
  String copyright(int year) {
    return '© $year Flutter Conf Latam - All rights reserved';
  }
}

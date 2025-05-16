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
  String get conctacUdla => 'See you at the University of the Americas!';

  @override
  String get conctactDescription => 'That\'s right! FlutterConf Latam 2025 will be held at the University of the Americas. Get ready for a unique experience on this incredible campus.';

  @override
  String get contactCapacity => 'Capacity: 600 people';

  @override
  String get aboutPlace => 'About the place';

  @override
  String get aboutDesc => 'We leave you three key facts so you can feel comfortable and enjoy the place to the fullest.';

  @override
  String get aboutInstalations => 'Campus facilities';

  @override
  String get aboutInstalacionsDesc => 'The facility features modern classrooms, auditoriums, and networking spaces, equipped with high-speed Wi-Fi throughout the campus.';

  @override
  String get aboutFood => 'Food and drinks';

  @override
  String get aboutFoodDesc => 'There are several cafeterias and food options available on campus, with special menus prepared for conference attendees.';

  @override
  String get aboutHowMoveDesc => 'The campus is easy to navigate with clear signage. Event staff, wearing Flutter T-shirts, will be available to assist you.';

  @override
  String get aboutHowMove => 'How to move?';

  @override
  String get contactExtraInfo => 'Extra information and useful tips';

  @override
  String get contactExtraInfoDesc => 'We share some recommendations so you can make the most of the event.';

  @override
  String get safety => 'Safety precautions';

  @override
  String get safetyDesc => 'Avoid carrying large amounts of cash and keep your valuables safe in crowded areas.';

  @override
  String get emergency => 'Emergency contacts';

  @override
  String get emergencyDesc => 'Dial 911 for police, ambulance, or firefighters. For tourist assistance, call +593-123-AYUDA.';

  @override
  String get taxi => 'Taxis and transportation';

  @override
  String get taxiDesc => 'Use licensed taxis or apps like Uber and Cabify. Avoid unregistered taxis.';

  @override
  String get deliveryApp => 'Delivery applications';

  @override
  String get deliveryAppDesc => 'Popular options include Rappi and Uber Eats for fast and reliable service.';

  @override
  String copyright(int year) {
    return '© $year Flutter Conf Latam';
  }
}

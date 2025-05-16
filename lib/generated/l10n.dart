// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(
      _current != null,
      'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(
      instance != null,
      'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Uh-oh, sorry!`
  String get errorPageTitle {
    return Intl.message(
      'Uh-oh, sorry!',
      name: 'errorPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `It wasn't Dash's fault - I swear!`
  String get errorPageSubtitle {
    return Intl.message(
      'It wasn\'t Dash\'s fault - I swear!',
      name: 'errorPageSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Return Home`
  String get errorReturnHomeButton {
    return Intl.message(
      'Return Home',
      name: 'errorReturnHomeButton',
      desc: '',
      args: [],
    );
  }

  /// `See you at the University of the Americas!`
  String get conctacUdla {
    return Intl.message(
      'See you at the University of the Americas!',
      name: 'conctacUdla',
      desc: '',
      args: [],
    );
  }

  /// `That's right! FlutterConf Latam 2025 will be held at the University of the Americas. Get ready for a unique experience on this incredible campus.`
  String get conctactDescription {
    return Intl.message(
      'That\'s right! FlutterConf Latam 2025 will be held at the University of the Americas. Get ready for a unique experience on this incredible campus.',
      name: 'conctactDescription',
      desc: '',
      args: [],
    );
  }

  /// `Capacity: 600 people`
  String get contactCapacity {
    return Intl.message(
      'Capacity: 600 people',
      name: 'contactCapacity',
      desc: '',
      args: [],
    );
  }

  /// `About the place`
  String get aboutPlace {
    return Intl.message(
      'About the place',
      name: 'aboutPlace',
      desc: '',
      args: [],
    );
  }

  /// `We leave you three key facts so you can feel comfortable and enjoy the place to the fullest.`
  String get aboutDesc {
    return Intl.message(
      'We leave you three key facts so you can feel comfortable and enjoy the place to the fullest.',
      name: 'aboutDesc',
      desc: '',
      args: [],
    );
  }

  /// `Campus facilities`
  String get aboutInstalations {
    return Intl.message(
      'Campus facilities',
      name: 'aboutInstalations',
      desc: '',
      args: [],
    );
  }

  /// `The facility features modern classrooms, auditoriums, and networking spaces, equipped with high-speed Wi-Fi throughout the campus.`
  String get aboutInstalacionsDesc {
    return Intl.message(
      'The facility features modern classrooms, auditoriums, and networking spaces, equipped with high-speed Wi-Fi throughout the campus.',
      name: 'aboutInstalacionsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Food and drinks`
  String get aboutFood {
    return Intl.message(
      'Food and drinks',
      name: 'aboutFood',
      desc: '',
      args: [],
    );
  }

  /// `There are several cafeterias and food options available on campus, with special menus prepared for conference attendees.`
  String get aboutFoodDesc {
    return Intl.message(
      'There are several cafeterias and food options available on campus, with special menus prepared for conference attendees.',
      name: 'aboutFoodDesc',
      desc: '',
      args: [],
    );
  }

  /// `The campus is easy to navigate with clear signage. Event staff, wearing Flutter T-shirts, will be available to assist you.`
  String get aboutHowMoveDesc {
    return Intl.message(
      'The campus is easy to navigate with clear signage. Event staff, wearing Flutter T-shirts, will be available to assist you.',
      name: 'aboutHowMoveDesc',
      desc: '',
      args: [],
    );
  }

  /// `How to move?`
  String get aboutHowMove {
    return Intl.message(
      'How to move?',
      name: 'aboutHowMove',
      desc: '',
      args: [],
    );
  }

  /// `Extra information and useful tips`
  String get contactExtraInfo {
    return Intl.message(
      'Extra information and useful tips',
      name: 'contactExtraInfo',
      desc: '',
      args: [],
    );
  }

  /// `We share some recommendations so you can make the most of the event.`
  String get contactExtraInfoDesc {
    return Intl.message(
      'We share some recommendations so you can make the most of the event.',
      name: 'contactExtraInfoDesc',
      desc: '',
      args: [],
    );
  }

  /// `Safety precautions`
  String get safety {
    return Intl.message(
      'Safety precautions',
      name: 'safety',
      desc: '',
      args: [],
    );
  }

  /// `Avoid carrying large amounts of cash and keep your valuables safe in crowded areas.`
  String get safetyDesc {
    return Intl.message(
      'Avoid carrying large amounts of cash and keep your valuables safe in crowded areas.',
      name: 'safetyDesc',
      desc: '',
      args: [],
    );
  }

  /// `Emergency contacts`
  String get emergency {
    return Intl.message(
      'Emergency contacts',
      name: 'emergency',
      desc: '',
      args: [],
    );
  }

  /// `Dial 911 for police, ambulance, or firefighters. For tourist assistance, call +593-123-AYUDA.`
  String get emergencyDesc {
    return Intl.message(
      'Dial 911 for police, ambulance, or firefighters. For tourist assistance, call +593-123-AYUDA.',
      name: 'emergencyDesc',
      desc: '',
      args: [],
    );
  }

  /// `Taxis and transportation`
  String get taxi {
    return Intl.message(
      'Taxis and transportation',
      name: 'taxi',
      desc: '',
      args: [],
    );
  }

  /// `Use licensed taxis or apps like Uber and Cabify. Avoid unregistered taxis.`
  String get taxiDesc {
    return Intl.message(
      'Use licensed taxis or apps like Uber and Cabify. Avoid unregistered taxis.',
      name: 'taxiDesc',
      desc: '',
      args: [],
    );
  }

  /// `Delivery applications`
  String get deliveryApp {
    return Intl.message(
      'Delivery applications',
      name: 'deliveryApp',
      desc: '',
      args: [],
    );
  }

  /// `Popular options include Rappi and Uber Eats for fast and reliable service.`
  String get deliveryAppDesc {
    return Intl.message(
      'Popular options include Rappi and Uber Eats for fast and reliable service.',
      name: 'deliveryAppDesc',
      desc: '',
      args: [],
    );
  }

  /// `How to get there?`
  String get howToGet {
    return Intl.message(
      'How to get there?',
      name: 'howToGet',
      desc: '',
      args: [],
    );
  }

  /// `© {year} Flutter Conf Latam`
  String copyright(int year) {
    return Intl.message(
      '© $year Flutter Conf Latam',
      name: 'copyright',
      desc: '',
      args: [year],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

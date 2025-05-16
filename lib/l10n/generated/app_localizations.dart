import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @errorPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Uh-oh, sorry!'**
  String get errorPageTitle;

  /// No description provided for @errorPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'It wasn\'t Dash\'s fault - I swear!'**
  String get errorPageSubtitle;

  /// No description provided for @errorReturnHomeButton.
  ///
  /// In en, this message translates to:
  /// **'Return Home'**
  String get errorReturnHomeButton;

  /// No description provided for @conctacUdla.
  ///
  /// In en, this message translates to:
  /// **'See you at the University of the Americas!'**
  String get conctacUdla;

  /// No description provided for @conctactDescription.
  ///
  /// In en, this message translates to:
  /// **'That\'s right! FlutterConf Latam 2025 will be held at the University of the Americas. Get ready for a unique experience on this incredible campus.'**
  String get conctactDescription;

  /// No description provided for @contactCapacity.
  ///
  /// In en, this message translates to:
  /// **'Capacity: 600 people'**
  String get contactCapacity;

  /// No description provided for @aboutPlace.
  ///
  /// In en, this message translates to:
  /// **'About the place'**
  String get aboutPlace;

  /// No description provided for @aboutDesc.
  ///
  /// In en, this message translates to:
  /// **'We leave you three key facts so you can feel comfortable and enjoy the place to the fullest.'**
  String get aboutDesc;

  /// No description provided for @aboutInstalations.
  ///
  /// In en, this message translates to:
  /// **'Campus facilities'**
  String get aboutInstalations;

  /// No description provided for @aboutInstalacionsDesc.
  ///
  /// In en, this message translates to:
  /// **'The facility features modern classrooms, auditoriums, and networking spaces, equipped with high-speed Wi-Fi throughout the campus.'**
  String get aboutInstalacionsDesc;

  /// No description provided for @aboutFood.
  ///
  /// In en, this message translates to:
  /// **'Food and drinks'**
  String get aboutFood;

  /// No description provided for @aboutFoodDesc.
  ///
  /// In en, this message translates to:
  /// **'There are several cafeterias and food options available on campus, with special menus prepared for conference attendees.'**
  String get aboutFoodDesc;

  /// No description provided for @aboutHowMoveDesc.
  ///
  /// In en, this message translates to:
  /// **'The campus is easy to navigate with clear signage. Event staff, wearing Flutter T-shirts, will be available to assist you.'**
  String get aboutHowMoveDesc;

  /// No description provided for @aboutHowMove.
  ///
  /// In en, this message translates to:
  /// **'How to move?'**
  String get aboutHowMove;

  /// No description provided for @contactExtraInfo.
  ///
  /// In en, this message translates to:
  /// **'Extra information and useful tips'**
  String get contactExtraInfo;

  /// No description provided for @contactExtraInfoDesc.
  ///
  /// In en, this message translates to:
  /// **'We share some recommendations so you can make the most of the event.'**
  String get contactExtraInfoDesc;

  /// No description provided for @safety.
  ///
  /// In en, this message translates to:
  /// **'Safety precautions'**
  String get safety;

  /// No description provided for @safetyDesc.
  ///
  /// In en, this message translates to:
  /// **'Avoid carrying large amounts of cash and keep your valuables safe in crowded areas.'**
  String get safetyDesc;

  /// No description provided for @emergency.
  ///
  /// In en, this message translates to:
  /// **'Emergency contacts'**
  String get emergency;

  /// No description provided for @emergencyDesc.
  ///
  /// In en, this message translates to:
  /// **'Dial 911 for police, ambulance, or firefighters. For tourist assistance, call +593-123-AYUDA.'**
  String get emergencyDesc;

  /// No description provided for @taxi.
  ///
  /// In en, this message translates to:
  /// **'Taxis and transportation'**
  String get taxi;

  /// No description provided for @taxiDesc.
  ///
  /// In en, this message translates to:
  /// **'Use licensed taxis or apps like Uber and Cabify. Avoid unregistered taxis.'**
  String get taxiDesc;

  /// No description provided for @deliveryApp.
  ///
  /// In en, this message translates to:
  /// **'Delivery applications'**
  String get deliveryApp;

  /// No description provided for @deliveryAppDesc.
  ///
  /// In en, this message translates to:
  /// **'Popular options include Rappi and Uber Eats for fast and reliable service.'**
  String get deliveryAppDesc;

  /// No description provided for @copyright.
  ///
  /// In en, this message translates to:
  /// **'© {year} Flutter Conf Latam'**
  String copyright(int year);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

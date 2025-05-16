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
/// import 'generated/app_localizations.dart';
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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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

  /// No description provided for @aboutVenueName.
  ///
  /// In en, this message translates to:
  /// **'See you at the University of the Americas!'**
  String get aboutVenueName;

  /// No description provided for @aboutVenueDescription.
  ///
  /// In en, this message translates to:
  /// **'That\'s right! FlutterConf Latam 2025 will be held at the University of the Americas. Get ready for a unique experience on this incredible campus.'**
  String get aboutVenueDescription;

  /// No description provided for @aboutVenueAddress.
  ///
  /// In en, this message translates to:
  /// **'Vía a Nayón, Quito'**
  String get aboutVenueAddress;

  /// No description provided for @aboutVenueCapacity.
  ///
  /// In en, this message translates to:
  /// **'Capacity: 600 people'**
  String get aboutVenueCapacity;

  /// No description provided for @aboutVenueHowToArrive.
  ///
  /// In en, this message translates to:
  /// **'How to get there?'**
  String get aboutVenueHowToArrive;

  /// No description provided for @aboutPlaceTitle.
  ///
  /// In en, this message translates to:
  /// **'About the place'**
  String get aboutPlaceTitle;

  /// No description provided for @aboutPlaceDescription.
  ///
  /// In en, this message translates to:
  /// **'We leave you three key facts so you can feel comfortable and enjoy the place to the fullest.'**
  String get aboutPlaceDescription;

  /// No description provided for @aboutPlaceInstallationTitle.
  ///
  /// In en, this message translates to:
  /// **'Campus facilities'**
  String get aboutPlaceInstallationTitle;

  /// No description provided for @aboutPlaceInstallationDescription.
  ///
  /// In en, this message translates to:
  /// **'The facility features modern classrooms, auditoriums, and networking spaces, equipped with high-speed Wi-Fi throughout the campus.'**
  String get aboutPlaceInstallationDescription;

  /// No description provided for @aboutPlaceFoodTitle.
  ///
  /// In en, this message translates to:
  /// **'Food and drinks'**
  String get aboutPlaceFoodTitle;

  /// No description provided for @aboutPlaceFoodDescription.
  ///
  /// In en, this message translates to:
  /// **'There are several cafeterias and food options available on campus, with special menus prepared for conference attendees.'**
  String get aboutPlaceFoodDescription;

  /// No description provided for @aboutPlaceMoveTitle.
  ///
  /// In en, this message translates to:
  /// **'How to move?'**
  String get aboutPlaceMoveTitle;

  /// No description provided for @aboutPlaceMoveDescription.
  ///
  /// In en, this message translates to:
  /// **'The campus is easy to navigate with clear signage. Event staff, wearing Flutter T-shirts, will be available to assist you.'**
  String get aboutPlaceMoveDescription;

  /// No description provided for @aboutExtraInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Extra information and useful tips'**
  String get aboutExtraInfoTitle;

  /// No description provided for @aboutExtraInfoDescription.
  ///
  /// In en, this message translates to:
  /// **'We share some recommendations so you can make the most of the event.'**
  String get aboutExtraInfoDescription;

  /// No description provided for @aboutExtraSafetyTitle.
  ///
  /// In en, this message translates to:
  /// **'Safety precautions'**
  String get aboutExtraSafetyTitle;

  /// No description provided for @aboutExtraSafetyDescription.
  ///
  /// In en, this message translates to:
  /// **'Avoid carrying large amounts of cash and keep your valuables safe in crowded areas.'**
  String get aboutExtraSafetyDescription;

  /// No description provided for @aboutExtraEmergencyTitle.
  ///
  /// In en, this message translates to:
  /// **'Emergency contacts'**
  String get aboutExtraEmergencyTitle;

  /// No description provided for @aboutExtraEmergencyDescription.
  ///
  /// In en, this message translates to:
  /// **'Dial 911 for police, ambulance, or firefighters. For tourist assistance, call +593-123-AYUDA.'**
  String get aboutExtraEmergencyDescription;

  /// No description provided for @aboutExtraTransportTitle.
  ///
  /// In en, this message translates to:
  /// **'Taxis and transportation'**
  String get aboutExtraTransportTitle;

  /// No description provided for @aboutExtraTransportDescription.
  ///
  /// In en, this message translates to:
  /// **'Use licensed taxis or apps like Uber and Cabify. Avoid unregistered taxis.'**
  String get aboutExtraTransportDescription;

  /// No description provided for @aboutExtraDeliveryAppTitle.
  ///
  /// In en, this message translates to:
  /// **'Delivery applications'**
  String get aboutExtraDeliveryAppTitle;

  /// No description provided for @aboutExtraDeliveryAppDescription.
  ///
  /// In en, this message translates to:
  /// **'Popular options include Rappi and Uber Eats for fast and reliable service.'**
  String get aboutExtraDeliveryAppDescription;

  /// No description provided for @copyright.
  ///
  /// In en, this message translates to:
  /// **'© {year} Flutter Conf Latam - All rights reserved'**
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

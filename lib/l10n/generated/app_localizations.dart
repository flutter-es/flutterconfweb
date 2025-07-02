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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @menuAboutText.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get menuAboutText;

  /// No description provided for @menuVenueText.
  ///
  /// In en, this message translates to:
  /// **'Venue'**
  String get menuVenueText;

  /// No description provided for @menuOrganizersText.
  ///
  /// In en, this message translates to:
  /// **'Organizers'**
  String get menuOrganizersText;

  /// No description provided for @menuGalleryText.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get menuGalleryText;

  /// No description provided for @menuContactText.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get menuContactText;

  /// No description provided for @menuBeSpeakerButton.
  ///
  /// In en, this message translates to:
  /// **'Be a speaker'**
  String get menuBeSpeakerButton;

  /// No description provided for @menuBuyTicketsButton.
  ///
  /// In en, this message translates to:
  /// **'Buy tickets'**
  String get menuBuyTicketsButton;

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

  /// No description provided for @errorDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Oops!'**
  String get errorDataTitle;

  /// No description provided for @errorDataMessage.
  ///
  /// In en, this message translates to:
  /// **'An error happened, try again'**
  String get errorDataMessage;

  /// No description provided for @errorDataRetryButton.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get errorDataRetryButton;

  /// No description provided for @homeMainTitle.
  ///
  /// In en, this message translates to:
  /// **'FlutterConfLatam 2025\nQuito - Ecuador'**
  String get homeMainTitle;

  /// No description provided for @homeMainDescription.
  ///
  /// In en, this message translates to:
  /// **'September 9th and 10th'**
  String get homeMainDescription;

  /// No description provided for @homeMainExperienceOne.
  ///
  /// In en, this message translates to:
  /// **'The Flutter experience awaits you in the '**
  String get homeMainExperienceOne;

  /// No description provided for @homeMainExperienceTwo.
  ///
  /// In en, this message translates to:
  /// **'Middle of the World'**
  String get homeMainExperienceTwo;

  /// No description provided for @homeCountDownDays.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get homeCountDownDays;

  /// No description provided for @homeCountDownHours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get homeCountDownHours;

  /// No description provided for @homeCountDownMinutes.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get homeCountDownMinutes;

  /// No description provided for @homeCountDownSeconds.
  ///
  /// In en, this message translates to:
  /// **'Seconds'**
  String get homeCountDownSeconds;

  /// No description provided for @homeFeatureTitle.
  ///
  /// In en, this message translates to:
  /// **'Do you love Flutter?'**
  String get homeFeatureTitle;

  /// No description provided for @homeFeatureDescription.
  ///
  /// In en, this message translates to:
  /// **'Then you can\'t miss FlutterConf Latam 2025, the event where you learn, connect, and get inspired.'**
  String get homeFeatureDescription;

  /// No description provided for @homeFeatureLearnTitle.
  ///
  /// In en, this message translates to:
  /// **'Learn from experts'**
  String get homeFeatureLearnTitle;

  /// No description provided for @homeFeatureLearnDescription.
  ///
  /// In en, this message translates to:
  /// **'Enjoy talks and workshops on Flutter, and more.'**
  String get homeFeatureLearnDescription;

  /// No description provided for @homeFeatureConnectTitle.
  ///
  /// In en, this message translates to:
  /// **'Connect with the community'**
  String get homeFeatureConnectTitle;

  /// No description provided for @homeFeatureConnectDescription.
  ///
  /// In en, this message translates to:
  /// **'Connect with people who vibrate like you.'**
  String get homeFeatureConnectDescription;

  /// No description provided for @homeFeatureGrowthTitle.
  ///
  /// In en, this message translates to:
  /// **'Get inspired and grow'**
  String get homeFeatureGrowthTitle;

  /// No description provided for @homeFeatureGrowthDescription.
  ///
  /// In en, this message translates to:
  /// **'Discover ideas, tools, and new perspectives for your projects.'**
  String get homeFeatureGrowthDescription;

  /// No description provided for @homeFeaturePrizeTitle.
  ///
  /// In en, this message translates to:
  /// **'Win amazing prizes'**
  String get homeFeaturePrizeTitle;

  /// No description provided for @homeFeaturePrizeDescription.
  ///
  /// In en, this message translates to:
  /// **'Participate in dynamics, challenges, and sweepstakes... and earn your very own Dash!'**
  String get homeFeaturePrizeDescription;

  /// No description provided for @homeFeatureBuyTicketTitle.
  ///
  /// In en, this message translates to:
  /// **'Buy your ticket from \${value} here!'**
  String homeFeatureBuyTicketTitle(double value);

  /// No description provided for @homeFeatureBuyTicketButton.
  ///
  /// In en, this message translates to:
  /// **'Buy tickets'**
  String get homeFeatureBuyTicketButton;

  /// No description provided for @homeNoveltiesTitle.
  ///
  /// In en, this message translates to:
  /// **'News for 2025'**
  String get homeNoveltiesTitle;

  /// No description provided for @homeNoveltiesDescription.
  ///
  /// In en, this message translates to:
  /// **'We\'ve always given our best, but now we want to offer you an even more complete Flutter experience.'**
  String get homeNoveltiesDescription;

  /// No description provided for @homeNoveltiesMerchTitle.
  ///
  /// In en, this message translates to:
  /// **'Ecuador edition merch'**
  String get homeNoveltiesMerchTitle;

  /// No description provided for @homeNoveltiesMerchDescription.
  ///
  /// In en, this message translates to:
  /// **'Unique swag, stickers, and more, just for this edition.'**
  String get homeNoveltiesMerchDescription;

  /// No description provided for @homeNoveltiesTriviaTitle.
  ///
  /// In en, this message translates to:
  /// **'Trivia lover?'**
  String get homeNoveltiesTriviaTitle;

  /// No description provided for @homeNoveltiesTriviaDescription.
  ///
  /// In en, this message translates to:
  /// **'We\'re preparing something you\'ll love.'**
  String get homeNoveltiesTriviaDescription;

  /// No description provided for @homeNoveltiesAppTitle.
  ///
  /// In en, this message translates to:
  /// **'We\'ll have an official app by 2025!'**
  String get homeNoveltiesAppTitle;

  /// No description provided for @homeNoveltiesAppDescription.
  ///
  /// In en, this message translates to:
  /// **'Everything you need for FlutterConf Latam is now in the palm of your hand.'**
  String get homeNoveltiesAppDescription;

  /// No description provided for @homeNoveltiesAppSoon.
  ///
  /// In en, this message translates to:
  /// **'Soon:'**
  String get homeNoveltiesAppSoon;

  /// No description provided for @homePricingTitle.
  ///
  /// In en, this message translates to:
  /// **'The Flutter experience within everyone\'s reach!'**
  String get homePricingTitle;

  /// No description provided for @homePricingDescription.
  ///
  /// In en, this message translates to:
  /// **'Take advantage of the early bird price and secure your spot'**
  String get homePricingDescription;

  /// No description provided for @homePricingEndDate.
  ///
  /// In en, this message translates to:
  /// **'Until {date}'**
  String homePricingEndDate(DateTime date);

  /// No description provided for @homePricingBuyTicketsButton.
  ///
  /// In en, this message translates to:
  /// **'Buy tickets'**
  String get homePricingBuyTicketsButton;

  /// No description provided for @homeCollaborationTitle.
  ///
  /// In en, this message translates to:
  /// **'Do you want to collaborate on another level?'**
  String get homeCollaborationTitle;

  /// No description provided for @homeCollaborationDescription.
  ///
  /// In en, this message translates to:
  /// **'Join us as a speaker or sponsor and be part of the heart of FlutterConf Latam 2025.'**
  String get homeCollaborationDescription;

  /// No description provided for @homeCollaborationSpeakerTitle.
  ///
  /// In en, this message translates to:
  /// **'Do you want to be a speaker?'**
  String get homeCollaborationSpeakerTitle;

  /// No description provided for @homeCollaborationSpeakerDescription.
  ///
  /// In en, this message translates to:
  /// **'If you are into inspiring and teaching, join us as a speaker.'**
  String get homeCollaborationSpeakerDescription;

  /// No description provided for @homeCollaborationSpeakerButton.
  ///
  /// In en, this message translates to:
  /// **'Be a speaker'**
  String get homeCollaborationSpeakerButton;

  /// No description provided for @homeCollaborationSponsorTitle.
  ///
  /// In en, this message translates to:
  /// **'Do you want to collaborate as a sponsor?'**
  String get homeCollaborationSponsorTitle;

  /// No description provided for @homeCollaborationSponsorDescription.
  ///
  /// In en, this message translates to:
  /// **'Your brand can also be part of this great experience!'**
  String get homeCollaborationSponsorDescription;

  /// No description provided for @homeCollaborationSponsorButton.
  ///
  /// In en, this message translates to:
  /// **'Be a sponsor'**
  String get homeCollaborationSponsorButton;

  /// No description provided for @homeSponsorsTitle.
  ///
  /// In en, this message translates to:
  /// **'Sponsors 2025'**
  String get homeSponsorsTitle;

  /// No description provided for @homeSponsorsMessage.
  ///
  /// In en, this message translates to:
  /// **'Your support makes FlutterConf 2025 a reality. Thank you for trusting us!'**
  String get homeSponsorsMessage;

  /// No description provided for @homeSponsorPlatinum.
  ///
  /// In en, this message translates to:
  /// **'Platinum'**
  String get homeSponsorPlatinum;

  /// No description provided for @homeSponsorGold.
  ///
  /// In en, this message translates to:
  /// **'Gold'**
  String get homeSponsorGold;

  /// No description provided for @homeSponsorSilver.
  ///
  /// In en, this message translates to:
  /// **'Silver'**
  String get homeSponsorSilver;

  /// No description provided for @homeSponsorInKind.
  ///
  /// In en, this message translates to:
  /// **'In kind'**
  String get homeSponsorInKind;

  /// No description provided for @homeFaqTitle.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get homeFaqTitle;

  /// No description provided for @homeFaqDescription.
  ///
  /// In en, this message translates to:
  /// **'Here we answer the most common ones so you can enjoy the Flutter experience without complications.'**
  String get homeFaqDescription;

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
  /// **'Dial 911 for police, ambulance, or firefighters. For tourist assistance, call '**
  String get aboutExtraEmergencyDescription;

  /// No description provided for @aboutExtraTransportTitle.
  ///
  /// In en, this message translates to:
  /// **'Taxis and transportation'**
  String get aboutExtraTransportTitle;

  /// No description provided for @aboutExtraTransportDescription.
  ///
  /// In en, this message translates to:
  /// **'Use licensed taxis or apps like Uber and/or Didi. Avoid unregistered taxis.'**
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

  /// No description provided for @organizersPeopleTitle.
  ///
  /// In en, this message translates to:
  /// **'Organizers'**
  String get organizersPeopleTitle;

  /// No description provided for @organizersPeopleDescription.
  ///
  /// In en, this message translates to:
  /// **'Behind every detail are organizers and tech communities committed to providing a great experience.'**
  String get organizersPeopleDescription;

  /// No description provided for @organizersCommunityTitle.
  ///
  /// In en, this message translates to:
  /// **'Allied communities'**
  String get organizersCommunityTitle;

  /// No description provided for @organizersCommunityDescription.
  ///
  /// In en, this message translates to:
  /// **'This event wouldn\'t be the same without the heart of Flutter: The communities that make it possible!'**
  String get organizersCommunityDescription;

  /// No description provided for @galleryMainTitle.
  ///
  /// In en, this message translates to:
  /// **'Remember is to live again...'**
  String get galleryMainTitle;

  /// No description provided for @galleryMainMessage.
  ///
  /// In en, this message translates to:
  /// **'We capture the best of every moment. The next epic photo could be yours! Check out some memories from past editions.'**
  String get galleryMainMessage;

  /// No description provided for @sessionsMainTitle.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get sessionsMainTitle;

  /// No description provided for @sessionsMainMessage.
  ///
  /// In en, this message translates to:
  /// **'Get ready for two days of inspiration, talks, debates, and plenty of networking! Discover everything about the speakers, their topics, and the full program of the event.'**
  String get sessionsMainMessage;

  /// No description provided for @sessionOptionDayOne.
  ///
  /// In en, this message translates to:
  /// **'September 9th'**
  String get sessionOptionDayOne;

  /// No description provided for @sessionOptionDayTwo.
  ///
  /// In en, this message translates to:
  /// **'September 10th'**
  String get sessionOptionDayTwo;

  /// No description provided for @sessionOptionDayTitle.
  ///
  /// In en, this message translates to:
  /// **'Day {day} - {date}'**
  String sessionOptionDayTitle(int day, String date);

  /// No description provided for @contactMainTitle.
  ///
  /// In en, this message translates to:
  /// **'Do you have any questions? Write to us.'**
  String get contactMainTitle;

  /// No description provided for @contactMainDescription.
  ///
  /// In en, this message translates to:
  /// **'Or if you prefer, contact us through our social media! We love staying in touch!'**
  String get contactMainDescription;

  /// No description provided for @footerTitle.
  ///
  /// In en, this message translates to:
  /// **'See you in Quito, Ecuador 🇪🇨 !'**
  String get footerTitle;

  /// No description provided for @footerDescription.
  ///
  /// In en, this message translates to:
  /// **'Take advantage of the event and discover the magic of Quito and its surroundings.'**
  String get footerDescription;

  /// No description provided for @footerSeeMore.
  ///
  /// In en, this message translates to:
  /// **'Learn more'**
  String get footerSeeMore;

  /// No description provided for @footerMemoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Will this be your first FlutterConf?'**
  String get footerMemoriesTitle;

  /// No description provided for @footerMemoriesDescription.
  ///
  /// In en, this message translates to:
  /// **'See how we experienced it in previous editions.'**
  String get footerMemoriesDescription;

  /// No description provided for @footerMemoriesVideoOne.
  ///
  /// In en, this message translates to:
  /// **'FlutterConf Latam 2024, Arequipa, Peru'**
  String get footerMemoriesVideoOne;

  /// No description provided for @footerMemoriesVideoTwo.
  ///
  /// In en, this message translates to:
  /// **'FlutterConf Latam 2023, Medellín, Colombia'**
  String get footerMemoriesVideoTwo;

  /// No description provided for @copyright.
  ///
  /// In en, this message translates to:
  /// **'© {year} Flutter Conf Latam - All rights reserved'**
  String copyright(int year);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

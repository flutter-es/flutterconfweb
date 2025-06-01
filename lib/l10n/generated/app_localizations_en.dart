// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get menuVenueText => 'Venue';

  @override
  String get menuGalleryText => 'Gallery';

  @override
  String get menuContactText => 'Contact';

  @override
  String get menuBeSpeakerButton => 'Be a speaker';

  @override
  String get menuBuyTicketsButton => 'Buy tickets';

  @override
  String get errorPageTitle => 'Uh-oh, sorry!';

  @override
  String get errorPageSubtitle => 'It wasn\'t Dash\'s fault - I swear!';

  @override
  String get errorReturnHomeButton => 'Return Home';

  @override
  String get errorDataTitle => 'Oops!';

  @override
  String get errorDataMessage => 'An error happened, try again';

  @override
  String get errorDataRetryButton => 'Retry';

  @override
  String get homeMainTitle => 'FlutterConfLatam 2025\nQuito - Ecuador';

  @override
  String get homeMainDescription => 'September 9th and 10th';

  @override
  String get homeMainExperienceOne =>
      'The Flutter experience awaits you in the ';

  @override
  String get homeMainExperienceTwo => 'Middle of the World';

  @override
  String get homeCountDownDays => 'Days';

  @override
  String get homeCountDownHours => 'Hours';

  @override
  String get homeCountDownMinutes => 'Minutes';

  @override
  String get homeCountDownSeconds => 'Seconds';

  @override
  String get homeFeatureTitle => 'Do you love Flutter?';

  @override
  String get homeFeatureDescription =>
      'Then you can\'t miss FlutterConf Latam 2025, the event where you learn, connect, and get inspired.';

  @override
  String get homeFeatureLearnTitle => 'Learn from experts';

  @override
  String get homeFeatureLearnDescription =>
      'Enjoy talks and workshops on Flutter, and more.';

  @override
  String get homeFeatureConnectTitle => 'Connect with the community';

  @override
  String get homeFeatureConnectDescription =>
      'Connect with people who vibrate like you.';

  @override
  String get homeFeatureGrowthTitle => 'Get inspired and grow';

  @override
  String get homeFeatureGrowthDescription =>
      'Discover ideas, tools, and new perspectives for your projects.';

  @override
  String get homeFeaturePrizeTitle => 'Win amazing prizes';

  @override
  String get homeFeaturePrizeDescription =>
      'Participate in dynamics, challenges, and sweepstakes... and earn your very own Dash!';

  @override
  String homeFeatureBuyTicketTitle(double value) {
    return 'Buy your ticket from \$$value here!';
  }

  @override
  String get homeFeatureBuyTicketButton => 'Buy tickets';

  @override
  String get homeNoveltiesTitle => 'News for 2025';

  @override
  String get homeNoveltiesDescription =>
      'We\'ve always given our best, but now we want to offer you an even more complete Flutter experience.';

  @override
  String get homeNoveltiesMerchTitle => 'Ecuador edition merch';

  @override
  String get homeNoveltiesMerchDescription =>
      'Unique swag, stickers, and more, just for this edition.';

  @override
  String get homeNoveltiesTriviaTitle => 'Trivia lover?';

  @override
  String get homeNoveltiesTriviaDescription =>
      'We\'re preparing something you\'ll love.';

  @override
  String get homeNoveltiesAppTitle => 'We\'ll have an official app by 2025!';

  @override
  String get homeNoveltiesAppDescription =>
      'Everything you need for FlutterConf Latam is now in the palm of your hand.';

  @override
  String get homeNoveltiesAppSoon => 'Soon:';

  @override
  String get homePricingTitle =>
      'The Flutter experience within everyone\'s reach!';

  @override
  String get homePricingDescription =>
      'Take advantage of the early bird price and secure your spot';

  @override
  String homePricingEndDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat(
      'MMMM d',
      localeName,
    );
    final String dateString = dateDateFormat.format(date);

    return 'Until $dateString';
  }

  @override
  String get homePricingBuyTicketsButton => 'Buy tickets';

  @override
  String get homeCollaborationTitle =>
      'Do you want to collaborate on another level?';

  @override
  String get homeCollaborationDescription =>
      'Join us as a speaker or sponsor and be part of the heart of FlutterConf Latam 2025.';

  @override
  String get homeCollaborationSpeakerTitle => 'Do you want to be a speaker?';

  @override
  String get homeCollaborationSpeakerDescription =>
      'If you are into inspiring and teaching, join us as a speaker.';

  @override
  String get homeCollaborationSpeakerButton => 'Be a speaker';

  @override
  String get homeCollaborationSponsorTitle =>
      'Do you want to collaborate as a sponsor?';

  @override
  String get homeCollaborationSponsorDescription =>
      'Your brand can also be part of this great experience!';

  @override
  String get homeCollaborationSponsorButton => 'Be a sponsor';

  @override
  String get homeCommunityTitle => 'Made with and for the community';

  @override
  String get homeCommunityDescription =>
      'This event wouldn\'t be the same without the heart of Flutter: The communities that make it possible!';

  @override
  String get homeFaqTitle => 'Frequently Asked Questions';

  @override
  String get homeFaqDescription =>
      'Here we answer the most common ones so you can enjoy the Flutter experience without complications.';

  @override
  String get aboutVenueName => 'See you at the University of the Americas!';

  @override
  String get aboutVenueDescription =>
      'That\'s right! FlutterConf Latam 2025 will be held at the University of the Americas. Get ready for a unique experience on this incredible campus.';

  @override
  String get aboutVenueAddress => 'Vía a Nayón, Quito';

  @override
  String get aboutVenueCapacity => 'Capacity: 600 people';

  @override
  String get aboutVenueHowToArrive => 'How to get there?';

  @override
  String get aboutPlaceTitle => 'About the place';

  @override
  String get aboutPlaceDescription =>
      'We leave you three key facts so you can feel comfortable and enjoy the place to the fullest.';

  @override
  String get aboutPlaceInstallationTitle => 'Campus facilities';

  @override
  String get aboutPlaceInstallationDescription =>
      'The facility features modern classrooms, auditoriums, and networking spaces, equipped with high-speed Wi-Fi throughout the campus.';

  @override
  String get aboutPlaceFoodTitle => 'Food and drinks';

  @override
  String get aboutPlaceFoodDescription =>
      'There are several cafeterias and food options available on campus, with special menus prepared for conference attendees.';

  @override
  String get aboutPlaceMoveTitle => 'How to move?';

  @override
  String get aboutPlaceMoveDescription =>
      'The campus is easy to navigate with clear signage. Event staff, wearing Flutter T-shirts, will be available to assist you.';

  @override
  String get aboutExtraInfoTitle => 'Extra information and useful tips';

  @override
  String get aboutExtraInfoDescription =>
      'We share some recommendations so you can make the most of the event.';

  @override
  String get aboutExtraSafetyTitle => 'Safety precautions';

  @override
  String get aboutExtraSafetyDescription =>
      'Avoid carrying large amounts of cash and keep your valuables safe in crowded areas.';

  @override
  String get aboutExtraEmergencyTitle => 'Emergency contacts';

  @override
  String get aboutExtraEmergencyDescription =>
      'Dial 911 for police, ambulance, or firefighters. For tourist assistance, call ';

  @override
  String get aboutExtraTransportTitle => 'Taxis and transportation';

  @override
  String get aboutExtraTransportDescription =>
      'Use licensed taxis or apps like Uber and/or Didi. Avoid unregistered taxis.';

  @override
  String get aboutExtraDeliveryAppTitle => 'Delivery applications';

  @override
  String get aboutExtraDeliveryAppDescription =>
      'Popular options include Rappi and Uber Eats for fast and reliable service.';

  @override
  String get galleryMainTitle => 'Remember is to live again...';

  @override
  String get galleryMainMessage =>
      'We capture the best of every moment. The next epic photo could be yours! Check out some memories from past editions.';

  @override
  String get contactMainTitle => 'Do you have any questions? Write to us.';

  @override
  String get contactMainDescription =>
      'Or if you prefer, contact us through our social media! We love staying in touch!';

  @override
  String get footerTitle => 'See you in Quito, Ecuador 🇪🇨 !';

  @override
  String get footerDescription =>
      'Take advantage of the event and discover the magic of Quito and its surroundings.';

  @override
  String get footerSeeMore => 'Learn more';

  @override
  String get footerMemoriesTitle => 'Will this be your first FlutterConf?';

  @override
  String get footerMemoriesDescription =>
      'See how we experienced it in previous editions.';

  @override
  String get footerMemoriesVideoOne => 'FlutterConf Latam 2024, Arequipa, Peru';

  @override
  String get footerMemoriesVideoTwo =>
      'FlutterConf Latam 2023, Medellín, Colombia';

  @override
  String copyright(int year) {
    return '© $year Flutter Conf Latam - All rights reserved';
  }
}

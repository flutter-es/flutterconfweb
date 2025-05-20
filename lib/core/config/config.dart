class Config {
  String get countryPageUrl => const String.fromEnvironment('COUNTRY_PAGE_URL');

  String get ticketPageUrl => const String.fromEnvironment('TICKET_PAGE_URL');

  String get cfpFormUrl => const String.fromEnvironment('CFP_FORM_URL');

  String get appStoreUrl => const String.fromEnvironment('APP_STORE_URL');

  String get googleAppUrl => const String.fromEnvironment('GOOGLE_APP_URL');

  String get venueMapUrl => const String.fromEnvironment('VENUE_MAP_URL');

  String get cityPhoneEmergency {
    return const String.fromEnvironment('CITY_PHONE_EMERGENCY');
  }

  String get contactEmail => const String.fromEnvironment('CONTACT_EMAIL');
}

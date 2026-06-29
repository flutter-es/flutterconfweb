enum AppRoutePath {
  splash(''),
  home('home'),
  sponsorship('be-sponsor'),
  /*
  venue('venue'),
  organizers('organizers'),
  pricing('pricing'),
  speakers('speakers'),
  schedule('schedule'),
  gallery('gallery'),
  contact('contact'),
  */
  privacyPolicy('privacy-policy'),
  termsConditions('terms-conditions');

  const AppRoutePath(this.pathName);

  final String pathName;
}

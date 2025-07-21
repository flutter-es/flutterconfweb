enum AppRoutePath {
  splash(''),
  home('home'),
  venue('venue'),
  organizers('organizers'),
  pricing('pricing'),
  schedule('schedule'),
  gallery('gallery'),
  contact('contact'),
  privacyPolicy('privacy-policy');

  const AppRoutePath(this.pathName);

  final String pathName;
}

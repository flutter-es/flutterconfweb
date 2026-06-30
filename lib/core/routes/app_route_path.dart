enum AppRoutePath {
  splash(''),
  home('home'),
  sponsorship('be-sponsor'),
  speakers('speakers'),
  privacyPolicy('privacy-policy'),
  termsConditions('terms-conditions');

  const AppRoutePath(this.pathName);

  final String pathName;
}

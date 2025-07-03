enum AppRoutePath {
  splash(''),
  home('home'),
  venue('venue'),
  organizers('organizers'),
  schedule('schedule'),
  gallery('gallery'),
  contact('contact');

  const AppRoutePath(this.pathName);

  final String pathName;
}

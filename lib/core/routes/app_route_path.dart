enum AppRoutePath {
  splash(''),
  home('home'),
  venue('venue'),
  organizers('organizers'),
  sessions('sessions'),
  gallery('gallery'),
  contact('contact');

  const AppRoutePath(this.pathName);

  final String pathName;
}

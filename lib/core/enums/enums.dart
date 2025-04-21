enum FlutterConfAnimations {
  flutterConfLogo('flutterconflogo'),
  flutterName('fluttername'),
  flutterLogo('flutterlogo'),
  flutterWarning('flutterwarning'),
  flutterDashWave('flutterdashwave'),
  flutterDashTicket('flutterdashticket'),
  flutterDashFlag('flutterdashflag'),
  flutterConfConstruction('flutterconfconstruction'),
  flutterDashConst('flutterdashconst');

  const FlutterConfAnimations(this.name);

  final String name;
}

enum SponsorshipLevels { platinum, gold, silver, bronze, inKind, other }

enum SponsorshipFilter { platinum, gold, silver, bronze, other, all }

enum SocialMediaLinks { twitter, linkedin, github }

enum SessionType {
  singleSpeaker,
  multiSpeaker,
  panel,
  keynote,
  eventSession,
  workshop,
}

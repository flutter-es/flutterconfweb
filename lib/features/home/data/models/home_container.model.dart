class HomeContainerModel {

  const HomeContainerModel({
    required this.title,
    required this.content,
    required this.buttonLabel,
    required this.dateLabel,
    required this.countryLabel,
    required this.cfpUrlLink
  });

  final String title;
  final String content;
  final String buttonLabel;
  final String dateLabel;
  final String countryLabel;
  final String cfpUrlLink;
}

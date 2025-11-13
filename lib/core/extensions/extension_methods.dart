extension StringX on String {
  bool get isValidUrl => Uri.parse(this).isAbsolute;
}

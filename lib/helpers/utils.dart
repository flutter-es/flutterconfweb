import 'package:url_launcher/url_launcher.dart';

class Utils {

  static Future<void> launchUrlLink(String url) async {
    await launchUrl(Uri.parse(url));
  }
}

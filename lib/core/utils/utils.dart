import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<void> launchUrlLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(Uri.parse(url));
  }
}

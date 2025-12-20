import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<void> launchUrlLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(Uri.parse(url));
  }

  static Future<void> downloadPdf(String assetPath, String fileName) async {
    if (kIsWeb) {
      final bytes = await rootBundle.load(assetPath);
      final list = bytes.buffer.asUint8List();

      final blob = html.Blob([list], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);

      html.AnchorElement(href: url)
        ..setAttribute('download', '$fileName.pdf')
        ..click();

      html.Url.revokeObjectUrl(url);
    } else {
      if (kDebugMode) {
        print('Downloading on non-web platform requires different logic.');
      }
    }
  }
}

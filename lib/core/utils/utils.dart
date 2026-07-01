import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static String mailtoWithSubject(String email, String subject) =>
      'mailto:$email?subject=${Uri.encodeComponent(subject)}';

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

  static const grayscaleMatrix = <double>[
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ];
}

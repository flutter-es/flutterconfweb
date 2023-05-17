import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/cfp/presentation/responsiveness/cfp_responsive_config.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {

  static Future<void> launchUrlLink(String url) async {
    await launchUrl(Uri.parse(url));
  }
}

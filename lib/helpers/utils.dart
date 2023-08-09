import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Utils {

  static GlobalKey<NavigatorState> mainNav = GlobalKey();
  static GlobalKey<NavigatorState> tabNav = GlobalKey();
  static GlobalKey<ScaffoldState> mainScaffold = GlobalKey();

  static Future<void> launchUrlLink(String url) async {
    await launchUrl(Uri.parse(url));
  }

  static Color getColorFromSponsorshipLevel(SponsorshipLevels level) {
    switch(level) {
      case SponsorshipLevels.platinum:
        return FlutterLatamColors.platinum;
      case SponsorshipLevels.gold:
        return FlutterLatamColors.gold;
      case SponsorshipLevels.silver:
        return FlutterLatamColors.silver;
      case SponsorshipLevels.bronze:
        return FlutterLatamColors.bronze;
      case SponsorshipLevels.inkind:
        return Colors.blueAccent;
      case SponsorshipLevels.other:
        return Colors.black;
    }
  }

  static String getTitleFromSponsorshipLevel(AppLocalizations loc, SponsorshipLevels level) {
    switch(level) {
      case SponsorshipLevels.platinum:
        return loc.sponsorshipPlatinum;
      case SponsorshipLevels.gold:
        return loc.sponsorshipGold;
      case SponsorshipLevels.silver:
        return loc.sponsorshipSilver;
      case SponsorshipLevels.bronze:
        return loc.sponsorshipBronze;
      case SponsorshipLevels.inkind:
        return loc.sponsorshipInKind;
      case SponsorshipLevels.other:
        return '';
    }
  }
}

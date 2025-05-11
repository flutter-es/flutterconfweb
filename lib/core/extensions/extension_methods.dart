import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/enums/enums.dart';
import 'package:flutter_conf_latam/styles/colors.dart';

extension SponsorshipLevelsX on SponsorshipLevels {
  Color get color {
    return switch (this) {
      SponsorshipLevels.platinum => FlutterLatamColors.platinum,
      SponsorshipLevels.gold => FlutterLatamColors.gold,
      SponsorshipLevels.silver => FlutterLatamColors.silver,
      SponsorshipLevels.bronze => FlutterLatamColors.bronze,
      SponsorshipLevels.inKind => Colors.blueAccent,
      SponsorshipLevels.other => Colors.black,
    };
  }

  /*
  String title(AppLocalizations l10n) {
    return switch (this) {
      SponsorshipLevels.platinum => l10n.sponsorshipPlatinum,
      SponsorshipLevels.gold => l10n.sponsorshipGold,
      SponsorshipLevels.silver => l10n.sponsorshipSilver,
      SponsorshipLevels.bronze => l10n.sponsorshipBronze,
      SponsorshipLevels.inKind => l10n.sponsorshipInKind,
      SponsorshipLevels.other => '',
    };
  }
  */
}

extension SessionTypeX on SessionType {
  Color get color {
    return switch (this) {
      SessionType.eventSession => Colors.lightBlue.withValues(alpha: 0.5),
      SessionType.panel => Colors.lightBlue.withValues(alpha: 0.25),
      SessionType.keynote => Colors.blue.withValues(alpha: 0.25),
      SessionType.workshop => Colors.greenAccent.withValues(alpha: 0.5),
      SessionType.singleSpeaker => Colors.orangeAccent.withValues(alpha: 0.25),
      _ => Colors.grey.withValues(alpha: 0.25),
    };
  }
}

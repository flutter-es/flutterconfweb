import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/features/sessions/data/models/session.metadata.model.dart';
import 'package:flutter_conf_latam/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_latam/helpers/enums.dart';
import 'package:flutter_conf_latam/l10n/generated/app_localizations.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static GlobalKey<NavigatorState> mainNav = GlobalKey();
  static GlobalKey<NavigatorState> tabNav = GlobalKey();
  static GlobalKey<ScaffoldState> mainScaffold = GlobalKey();

  static Future<void> launchUrlLink(String url) async {
    await launchUrl(Uri.parse(url));
  }

  static Color getColorFromSponsorshipLevel(SponsorshipLevels level) {
    switch (level) {
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

  static String getTitleFromSponsorshipLevel(
    AppLocalizations loc,
    SponsorshipLevels level,
  ) {
    switch (level) {
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

  static bool isMobile() {
    return getDeviceType(MediaQuery.sizeOf(Utils.mainNav.currentContext!)) ==
        DeviceScreenType.mobile;
  }

  static void showSessionInfo(Widget sessionContent) {
    showUIModal(
      Utils.mainNav.currentContext!,
      Container(
        margin:
            isMobile()
                ? FlutterConfLatamStyles.xLargeMargin.copyWith(
                  left: 0,
                  right: 0,
                  bottom: 0,
                )
                : FlutterConfLatamStyles.largeMargin,
        padding:
            isMobile()
                ? const EdgeInsets.symmetric(
                  horizontal: FlutterConfLatamStyles.mediumSize,
                  vertical: FlutterConfLatamStyles.largeSize,
                )
                : FlutterConfLatamStyles.bannerPadding,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              isMobile()
                  ? const BorderRadius.only(
                    topLeft: Radius.circular(
                      FlutterConfLatamStyles.smallRadius,
                    ),
                    topRight: Radius.circular(
                      FlutterConfLatamStyles.smallRadius,
                    ),
                  )
                  : BorderRadius.circular(FlutterConfLatamStyles.smallRadius),
        ),
        child: sessionContent,
      ),
      dismissible: true,
    );
  }

  static void showSpeakerInfo(Widget speakerContent) {
    showUIModal(
      Utils.mainNav.currentContext!,
      Container(
        margin:
            isMobile()
                ? FlutterConfLatamStyles.xLargeMargin.copyWith(
                  left: 0,
                  right: 0,
                  bottom: 0,
                )
                : FlutterConfLatamStyles.largeMargin,
        padding:
            isMobile()
                ? const EdgeInsets.symmetric(
                  horizontal: FlutterConfLatamStyles.mediumSize,
                  vertical: FlutterConfLatamStyles.largeSize,
                )
                : FlutterConfLatamStyles.bannerPadding,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              isMobile()
                  ? const BorderRadius.only(
                    topLeft: Radius.circular(
                      FlutterConfLatamStyles.smallRadius,
                    ),
                    topRight: Radius.circular(
                      FlutterConfLatamStyles.smallRadius,
                    ),
                  )
                  : BorderRadius.circular(FlutterConfLatamStyles.smallRadius),
        ),
        child: speakerContent,
      ),
      dismissible: true,
    );
  }

  static void showUIModal(
    BuildContext context,
    Widget child, {
    bool dismissible = false,
    VoidCallback? onDismissed,
  }) {
    if (isMobile()) {
      showModalBottomSheet<void>(
        isDismissible: dismissible,
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (_) {
          return child;
        },
      ).whenComplete(() => onDismissed?.call());
    } else {
      showDialog<void>(
        context: context,
        builder: (_) {
          return FractionallySizedBox(
            widthFactor: 0.7,
            heightFactor: 0.8,
            child: child,
          );
        },
      ).whenComplete(() {
        onDismissed?.call();
      });
    }
  }

  static SessionModel? getSessionFromSlotId(
    List<SessionModel> sessions,
    int id,
  ) {
    SessionModel? session;

    if (sessions.any((SessionModel s) => s.scheduleSlot == '1')) {
      session = sessions.firstWhere((s) => s.scheduleSlot == id.toString());
    }

    return session;
  }

  static Widget getTimeLabelHeader(
    String label, {
    MainAxisAlignment alignment = MainAxisAlignment.end,
  }) {
    final timeLabelStyle =
        isMobile() ? FlutterConfLatamStyles.h6 : FlutterConfLatamStyles.h7;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: alignment,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(label, style: timeLabelStyle)],
    );
  }

  static List<SessionMetadataModel> buildMetadataListFromSession(
    AppLocalizations appLoc,
    SessionModel session,
  ) {
    return [
      SessionMetadataModel(
        label: appLoc.sessionLang,
        value: session.language,
        bgColor: Colors.blueAccent,
        labelColor: Colors.white,
      ),
      SessionMetadataModel(
        label: appLoc.sessionFormat,
        value: session.format,
        bgColor: Colors.greenAccent,
        labelColor: Colors.black,
      ),
      SessionMetadataModel(
        label: appLoc.sessionLevel,
        value: session.level,
        bgColor: Colors.orangeAccent,
        labelColor: Colors.black,
      ),
    ];
  }

  static Color getColorFromSessionType(SessionType sessionType) {
    switch (sessionType) {
      case SessionType.eventSession:
        return Colors.lightBlue.withValues(alpha: 0.5);
      case SessionType.panel:
        return Colors.lightBlue.withValues(alpha: 0.25);
      case SessionType.keynote:
        return Colors.blue.withValues(alpha: 0.25);
      case SessionType.workshop:
        return Colors.greenAccent.withValues(alpha: 0.5);
      case SessionType.singleSpeaker:
        return Colors.orangeAccent.withValues(alpha: 0.25);
      default:
        return Colors.grey.withValues(alpha: 0.25);
    }
  }
}

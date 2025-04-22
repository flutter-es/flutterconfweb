import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/features/sessions/data/models/session.metadata.model.dart';
import 'package:flutter_conf_latam/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_latam/l10n/generated/app_localizations.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<void> launchUrlLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(Uri.parse(url));
  }

  static bool isMobile(BuildContext context) {
    return getDeviceType(MediaQuery.sizeOf(context)) == DeviceScreenType.mobile;
  }

  static void showSessionInfo(BuildContext context, Widget sessionContent) {
    showUIModal(context, sessionContent, dismissible: true);
  }

  static void showSpeakerInfo(BuildContext context, Widget speakerContent) {
    showUIModal(context, speakerContent, dismissible: true);
  }

  static void showUIModal(
    BuildContext context,
    Widget child, {
    bool dismissible = false,
  }) {
    if (isMobile(context)) {
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: dismissible,
        backgroundColor: Colors.transparent,
        builder: (_) {
          return Container(
            margin: FlutterConfLatamStyles.xLargeMargin.copyWith(
              left: 0,
              right: 0,
              bottom: 0,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: FlutterConfLatamStyles.mediumSize,
              vertical: FlutterConfLatamStyles.largeSize,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(FlutterConfLatamStyles.smallRadius),
              ),
            ),
            child: child,
          );
        },
      );
    } else {
      showDialog<void>(
        context: context,
        builder: (_) {
          return FractionallySizedBox(
            widthFactor: 0.7,
            heightFactor: 0.8,
            child: Container(
              margin: FlutterConfLatamStyles.largeMargin,
              padding: FlutterConfLatamStyles.bannerPadding,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  FlutterConfLatamStyles.smallRadius,
                ),
              ),
              child: child,
            ),
          );
        },
      );
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
    BuildContext context,
    String label, {
    MainAxisAlignment alignment = MainAxisAlignment.end,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: alignment,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              isMobile(context)
                  ? FlutterConfLatamStyles.h6
                  : FlutterConfLatamStyles.h7,
        ),
      ],
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
}

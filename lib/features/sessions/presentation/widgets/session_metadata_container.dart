import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionMetadataContainer extends ConsumerWidget {
  const SessionMetadataContainer({
    required this.session,
    super.key,
  });

  final SessionModel session;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = ref.watch(appLocalizationsProvider);
    final metadataList = Utils.buildMetadataListFromSession(appLoc, session);

    return Wrap(
      children: List.generate(metadataList.length, (index) {
        final metadataItem = metadataList[index];

        return Container(
          margin: const EdgeInsets.only(
            bottom: FlutterConfLatamStyles.mediumSize,
            right: FlutterConfLatamStyles.smallSize,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: FlutterConfLatamStyles.smallSize,
                ),
                child: Text(
                  metadataItem.label,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              Container(
                padding: FlutterConfLatamStyles.xsmallPadding.copyWith(
                  left: FlutterConfLatamStyles.mediumSize,
                  right: FlutterConfLatamStyles.mediumSize,
                ),
                margin: const EdgeInsets.only(
                  right: FlutterConfLatamStyles.smallSize,
                ),
                decoration: BoxDecoration(
                  color: metadataItem.bgColor,
                  borderRadius:
                      BorderRadius.circular(FlutterConfLatamStyles.smallRadius),
                ),
                child: Text(
                  metadataItem.value,
                  style: TextStyle(
                    color: metadataItem.labelColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      })
          .animate(
            interval: 200.ms,
          )
          .scaleXY(
            begin: 0.8,
            end: 1,
            curve: Curves.easeInOut,
            duration: 0.5.seconds,
          )
          .fadeIn(
            curve: Curves.easeInOut,
            duration: 0.5.seconds,
          ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/sessions/presentation/providers/sessions_provider.dart';
import 'package:flutter_conf_colombia/features/sessions/presentation/widgets/session_main_content.dart';
import 'package:flutter_conf_colombia/features/sessions/presentation/widgets/session_metadata_container.dart';
import 'package:flutter_conf_colombia/features/sessions/presentation/widgets/session_tags_container.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/providers/speakers_providers.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/widgets/speaker_badge.dart';
import 'package:flutter_conf_colombia/helpers/ui_extensions.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SessionContainer extends ConsumerWidget {
  const SessionContainer({
    super.key,
    required this.speakerId,
  });
  final String speakerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = ref.watch(appLocalizationsProvider);
    final sessions = ref.watch(sessionsProvider);

    return Container(
      child: sessions.when(
        data: (sessionList) {
          final speakerSession = sessionList
              .firstWhere((element) => element.speakerId == speakerId);

          return speakerSession.isAnnounced
              ? SessionMainContent(
                  session: speakerSession,
                )
              : Container(
                  margin: const EdgeInsets.only(
                      top: FlutterConfLatamStyles.mediumSize),
                  padding: FlutterConfLatamStyles.bannerPadding,
                  decoration: BoxDecoration(
                    color: FlutterLatamColors.lightBlue.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(
                        FlutterConfLatamStyles.smallRadius),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.warning_amber_outlined,
                          color: FlutterLatamColors.lightBlue,
                          size: FlutterConfLatamStyles.largeSize),
                      FlutterConfLatamStyles.smallVGap,
                      Text(
                        appLoc.sessionTalkNotification,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: FlutterLatamColors.lightBlue,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
                  .animate()
                  .slideY(
                    begin: 0.25,
                    end: 0,
                    curve: Curves.easeInOut,
                    duration: 0.5.seconds,
                  )
                  .fadeIn(
                    curve: Curves.easeInOut,
                    duration: 0.5.seconds,
                  );
        },
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

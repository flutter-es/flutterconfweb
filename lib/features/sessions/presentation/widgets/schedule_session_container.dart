import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_session_speaker_badge.dart';
import 'package:flutter_conf_colombia/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_colombia/features/sessions/presentation/widgets/session_main_content.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScheduleSessionContainer extends ConsumerWidget {

  final SessionModel session;
  final List<SpeakerModel> speakers;

  const ScheduleSessionContainer({
    required this.session,
    required this.speakers,
    super.key
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appLoc = ref.watch(appLocalizationsProvider);

    final paddingValue = getValueForScreenType(context: context,
      mobile: FlutterConfLatamStyles.smallPadding,
      tablet: FlutterConfLatamStyles.mediumPadding,
      desktop: FlutterConfLatamStyles.mediumPadding,
    );
    
    return Padding(
      padding: paddingValue,
      child: Material(
        color: Colors.transparent,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(right: FlutterConfLatamStyles.mediumSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SessionMainContent(
                session: session,
                additionalTopContent: session.room.isNotEmpty ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: FlutterConfLatamStyles.smallSize),
                      child: Text(appLoc.scheduleRoomLabel, style: const TextStyle(color: Colors.black)),
                    ),
                    Container(
                      margin: FlutterConfLatamStyles.smallMargin.copyWith(
                        top: 0,
                        left: 0,
                        bottom: FlutterConfLatamStyles.largeSize,
                      ),
                      padding: FlutterConfLatamStyles.smallPadding.copyWith(
                        left: FlutterConfLatamStyles.mediumSize,
                        right: FlutterConfLatamStyles.mediumSize,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterLatamColors.brightYellow,
                        borderRadius: BorderRadius.circular(FlutterConfLatamStyles.largeRadius),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.door_back_door_outlined, color: Colors.black),
                          FlutterConfLatamStyles.xsmallHGap,
                          Text(session.room, style: FlutterConfLatamStyles.h7.copyWith(color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                ) : null,
                additionalBottomContent: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FlutterConfLatamStyles.smallVGap,
                    Text(appLoc.sessionSpeakerLabel, style: FlutterConfLatamStyles.h7),
                    FlutterConfLatamStyles.smallVGap,
                    Wrap(
                      children: [
                        for(final speaker in speakers)
                          ScheduleSessionSpeakerBadge(
                            speakerInfo: speaker,
                          ),
                      ].animate(
                        interval: 200.ms,
                      ).slideX(
                        begin: -0.25, end: 0,
                        curve: Curves.easeInOut,
                        duration: 0.5.seconds,
                      ).fadeIn(
                        curve: Curves.easeInOut,
                        duration: 0.5.seconds,
                      ),
                    ),
                  ],
                ),  
              ),
            ],
          ),
        ),
      ),
    );
  }
}
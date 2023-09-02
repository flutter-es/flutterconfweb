import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/schedule/data/models/schedule_session.model.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/providers/schedule_providers.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/responsiveness/schedule_content_responsive_config.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_session_add_to_fav.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_session_room_info.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_session_speaker_badge.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleSession extends ConsumerStatefulWidget {

  const ScheduleSession({
    required this.sessionInfo,
    super.key,
  });

  final ScheduleSessionModel sessionInfo;

  @override
  ConsumerState<ScheduleSession> createState() => _ScheduleSessionState();
}

class _ScheduleSessionState extends ConsumerState<ScheduleSession> {

  @override
  void initState() {
    super.initState();

    Timer.periodic(1.seconds, (timer) {
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final currentEventTime = ref.read(currentEventLocationTimeProvider(widget.sessionInfo.dateTime));
    final bgColor = currentEventTime ? FlutterLatamColors.brightYellow : FlutterLatamColors.lightBlue;
    final uiConfig = ScheduleContentResponsiveConfig.getSchedulePageResponsiveConfig(context);

    return Container(
      padding: FlutterConfLatamStyles.mediumPadding,
      margin: FlutterConfLatamStyles.mediumMargin.copyWith(
        top: 0,
        right: 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(FlutterConfLatamStyles.smallRadius),
        color: bgColor.withOpacity(0.125),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ScheduleSessionRoomInfo(
                roomInfo:  widget.sessionInfo.room,
              ),
            ],
          ),
          FlutterConfLatamStyles.smallVGap,
          Padding(
            padding: FlutterConfLatamStyles.mediumPadding,
            child: Text(widget.sessionInfo.session.title,
              style: FlutterConfLatamStyles.h5.copyWith(color: Colors.black),
            ),
          ),
          FlutterConfLatamStyles.mediumVGap,
          Flex(
            direction: uiConfig.contentBottomRowOrientation,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: uiConfig.contentBottomLeftFlex,
                child: Wrap(
                  children: [
                    for(final speaker in widget.sessionInfo.speakers)
                      ScheduleSessionSpeakerBadge(
                        speakerInfo: speaker,
                      ),
                  ],
                ),
              ),
              const ScheduleSessionAddToFavorite(),
            ],
          ),
        ],
      ),
    );
  }
}

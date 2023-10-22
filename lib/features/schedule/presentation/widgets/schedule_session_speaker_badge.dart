import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';

class ScheduleSessionSpeakerBadge extends StatelessWidget {

  const ScheduleSessionSpeakerBadge({
    required this.speakerInfo,
    super.key,
  });

  final SpeakerModel speakerInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: FlutterConfLatamStyles.mediumSize),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar( 
            backgroundImage: NetworkImage(
              speakerInfo.photo!,  
            ),
          ),
          FlutterConfLatamStyles.xsmallHGap,
          Text(
            speakerInfo.name!, 
            style: FlutterConfLatamStyles.h7.copyWith(color: Colors.black),
          ),
          FlutterConfLatamStyles.mediumHGap,
        ]
      ),
    );
  }
}

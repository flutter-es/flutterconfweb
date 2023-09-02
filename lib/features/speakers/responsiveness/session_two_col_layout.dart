import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/sessions/presentation/widgets/session_container.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/widgets/speaker_content.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';

class SpeakerSessionTwoColumnLayout extends StatelessWidget {

  final SpeakerModel speaker;
  const SpeakerSessionTwoColumnLayout({
    required this.speaker,
    super.key,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: FlutterConfLatamStyles.largeSize),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 250,
            child: SpeakerContent(
              speaker: speaker,
            ),
          ),
          FlutterConfLatamStyles.mediumHGap,
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(right: FlutterConfLatamStyles.largeSize),
              child: SessionContainer(speakerId: speaker.id!),
            ),
          ),
        ],
      ),
    );
  }
}

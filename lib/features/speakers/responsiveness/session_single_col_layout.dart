import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/sessions/presentation/widgets/session_container.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/widgets/speaker_content.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';

class SpeakerSessionSingleColumnLayout extends StatelessWidget {

  const SpeakerSessionSingleColumnLayout({
    required this.speaker,
    super.key,
  });

  final SpeakerModel speaker;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: FlutterConfLatamStyles.mediumPadding,
        child: Column(
          children: [
            SpeakerContent(
              speaker: speaker,
            ),
            SessionContainer(speakerId: speaker.id!)
          ],
        ),
      ),
    );
  }
}

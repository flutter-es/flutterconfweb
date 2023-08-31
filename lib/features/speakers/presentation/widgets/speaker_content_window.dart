import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/sessions/presentation/widgets/session_container.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/widgets/speaker_badge.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';

class SpeakerContentWindow extends StatelessWidget {
  const SpeakerContentWindow({
      required this.speaker,
      super.key,
    }
  );

  final SpeakerModel speaker;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Padding(
          padding: FlutterConfLatamStyles.mediumPadding,
          child: Column(
            children: [
              SpeakerBadge(
                speaker: speaker,
              ),
              SessionContainer(speakerId: speaker.id!)
            ],
          ),
        ),
      ),
    );
  }
}

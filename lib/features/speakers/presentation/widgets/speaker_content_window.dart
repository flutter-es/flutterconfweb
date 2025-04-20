import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/features/sessions/presentation/responsiveness/speaker_session_config.dart';
import 'package:flutter_conf_latam/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_latam/features/speakers/responsiveness/session_single_col_layout.dart';
import 'package:flutter_conf_latam/features/speakers/responsiveness/session_two_col_layout.dart';

class SpeakerContentWindow extends StatelessWidget {
  const SpeakerContentWindow({required this.speaker, super.key});

  final SpeakerModel speaker;

  @override
  Widget build(BuildContext context) {
    final config = SpeakerSessionConfig.getSpeakerSessionConfig(context);

    return Material(
      color: Colors.transparent,
      child: Visibility(
        visible: config.twoColumnLayout,
        replacement: SpeakerSessionSingleColumnLayout(speaker: speaker),
        child: SpeakerSessionTwoColumnLayout(speaker: speaker),
      ),
    );
  }
}

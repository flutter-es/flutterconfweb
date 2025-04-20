import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SpeakerSessionConfig {
  SpeakerSessionConfig({required this.twoColumnLayout});

  final bool twoColumnLayout;

  static SpeakerSessionConfig getSpeakerSessionConfig(BuildContext ctxt) {
    return getValueForScreenType(
      context: ctxt,
      mobile: SpeakerSessionConfig(twoColumnLayout: false),
      tablet: SpeakerSessionConfig(twoColumnLayout: false),
      desktop: SpeakerSessionConfig(twoColumnLayout: true),
    );
  }
}

// ignore_for_file: inference_failure_on_function_invocation

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/features/speakers/data/repositories/speakers.repository.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/providers/speakers_providers.dart';
import 'package:flutter_conf_colombia/features/speakers/responsiveness/speakers_responsive.config.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/widgets/speaker_badge.dart';
import 'package:flutter_conf_colombia/helpers/constants.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SpeakersContainer extends ConsumerWidget {
  const SpeakersContainer({super.key});
  static const height = 600.0;
  static const title = 'speakers_container';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speakers = ref.watch(speakersProvider);
    final appLoc = ref.watch(appLocalizationsProvider);
    final uiConfig = SpeakersResponsiveConfig.getSpeakersBannerConfig(context);
    return Container(
      margin: FlutterConfLatamStyles.largeMargin,
      padding: FlutterConfLatamStyles.largePadding,
      alignment: Alignment.center,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
      ),
      child: Column(
        children: [
          Container(
            // expositoresLtH (42:4)
            margin: const EdgeInsets.fromLTRB(0, 0, 1, 50),
            child: Text(
              appLoc.speakers,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 50,
                fontWeight: FontWeight.w700,
                height: 1.5,
                color: Color(0xff000000),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 50),
            constraints: const BoxConstraints(
              maxWidth: 4280,
            ),
            child: Text(
              appLoc.firstSpeakers,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                fontWeight: FontWeight.w700,
                height: 1.1799998983,
                color: Color(0xff003087),
              ),
            ),
          ),
          FlutterConfLatamStyles.largeVGap,
          Container(
            child: speakers.when(
              data: (speakersList) {
                return Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 64,
                  children: [
                    for (var speaker in speakersList)
                      SpeakerBadge(speaker: speaker)
                  ],
                );
              },
              error: (error, stackTrace) {
                return Center(child: Text(error.toString()));
              },
              loading: () {
                return const Center(child: CircularProgressIndicator());
              },
            ),
          )
        ],
      ),
    );
  }
}

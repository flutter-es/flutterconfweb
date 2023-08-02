// ignore_for_file: inference_failure_on_function_invocation

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/features/speakers/data/repositories/speakers.repository.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/providers/speakers_providers.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/widgets/speakers_list.dart';
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
    
    final appLoc = ref.watch(appLocalizationsProvider);
    final config = SpeakersResponsiveConfig.getSpeakersBannerConfig(context);
    
    return Container(
      margin: config.bannerMargin,
      padding: config.bannerPadding,
      alignment: Alignment.center,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Text(
            appLoc.speakers,
            textAlign: TextAlign.center,
            style: FlutterConfLatamStyles.h3,
          ),
          Container(
            padding: FlutterConfLatamStyles.bannerPadding,
            child: Text(
              appLoc.firstSpeakers,
              textAlign: TextAlign.center,
              style: FlutterConfLatamStyles.h5,
            ),
          ),
          FlutterConfLatamStyles.largeVGap,
          const SpeakersList()
        ],
      ),
    );
  }
}

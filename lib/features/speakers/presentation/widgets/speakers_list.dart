import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/providers/speakers_providers.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/widgets/speaker_badge.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpeakersList extends ConsumerWidget {
  const SpeakersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final speakers = ref.watch(speakersProvider);

    return Container(
      child: speakers.when(
        data: (speakersList) {
          return Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 64,
            children: [
              for (var speaker in speakersList)
                SpeakerBadge(speaker: speaker)
            ].animate(
              interval: 100.ms,
            ).scaleXY(
              begin: 0.5, end: 1,
              curve: Curves.easeInOut,
            )
            .fadeIn(),
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

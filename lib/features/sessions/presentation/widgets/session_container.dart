import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/providers/speakers_providers.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/widgets/speaker_badge.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionContainer extends ConsumerWidget {
  final String speakerid;
  
  const SpeakersList({super.key, required this.speakerid});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speakers = ref.watch(speakersProvider);

    return Container(
      child: speakers.when(
        data: (speakersList) {
            final speakersession = sessionList.firstWhere((element) => element.id == speakerid);
          return Wrap(
            
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 64,
            children: [
              for (var speaker in speakersList.where((s) => s.display! == true))
                SpeakerBadge(
                  speaker: speaker,
                  onSpeakerTap: (SpeakerModel speakerModel) {
                    Utils.showSpeakerInfo(
                      SpeakerBadge(
                        speaker: speakerModel,
                        onSpeakerTap: () {},
                      ),
                    );
                  },
                )
            ]
                .animate(
                  interval: 100.ms,
                )
                .scaleXY(
                  begin: 0.5,
                  end: 1,
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

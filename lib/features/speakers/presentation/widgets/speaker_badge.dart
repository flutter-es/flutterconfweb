import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';

class SpeakerBadge extends StatelessWidget {
  final SpeakerModel speaker;
  const SpeakerBadge({required this.speaker, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Padding(
          padding: FlutterConfLatamStyles.smallPadding,
          child: Column(
            children: [
              ClipOval(
                child: Image.network(
                  speaker.photo!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              FlutterConfLatamStyles.smallVGap,
              Text(
                speaker.name!,
                style: FlutterConfLatamStyles.h6,
                textAlign: TextAlign.center,
              ),
              ClipOval(
                child: Image.network(
                  speaker.country!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              if (speaker.company!.isNotEmpty)
                FlutterConfLatamStyles.smallVGap
              else 
                const SizedBox.shrink(),
              Text(speaker.company!, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200),
                child: Text(speaker.title!, textAlign: TextAlign.center)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                for (var social in speaker.socialMediaLinks!)
                  IconButton(
                    onPressed: () {
                      Utils.launchUrlLink(social.link);
                    },
                    icon: Icon(
                      FlutterConfLatamIcons.getIconFromEnum(social.type),
                      color: FlutterLatamColors.blueText,
                    ),
                  ),
              ])
            ].animate(
              interval: 100.ms,
            )
            .slideY(
              begin: 0.5, end: 0,
              curve: Curves.easeInOut,
            )
            .fadeIn(),
          ),
        ),
    );
  }
}

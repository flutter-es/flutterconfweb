import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';

class SpeakerContent extends StatelessWidget {
  SpeakerContent({
    required this.speaker,
    this.isHovered,
    super.key,
  });

  bool? isHovered;

  final SpeakerModel speaker;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isHovered != null && isHovered!
                      ? FlutterLatamColors.lightBlue
                      : Colors.transparent,
                ),
              )
                  .animate(
                    target: isHovered != null && isHovered! ? 1 : 0,
                    onComplete: (controller) {
                      if (isHovered != null && isHovered!) {
                        controller.repeat();
                      } else {
                        controller.stop();
                      }
                    },
                  )
                  .scaleXY(
                    begin: 1,
                    end: 1.5,
                    duration: 1.seconds,
                    curve: Curves.easeInOut,
                  )
                  .fadeOut(
                    duration: 1.seconds,
                    curve: Curves.easeInOut,
                  ),
              ClipOval(
                child: Image.network(
                  speaker.photo!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  color: isHovered != null && isHovered!
                      ? FlutterLatamColors.darkBlue.withOpacity(0.8)
                      : null,
                  colorBlendMode: isHovered != null && isHovered!
                      ? BlendMode.color
                      : BlendMode.multiply,
                ),
              ),
            ],
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
        Text(speaker.company!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200),
          child: Text(speaker.title!, textAlign: TextAlign.center),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final social in speaker.socialMediaLinks!)
              IconButton(
                onPressed: () {
                  Utils.launchUrlLink(social.link);
                },
                icon: Icon(
                  FlutterConfLatamIcons.getIconFromEnum(social.type),
                  color: FlutterLatamColors.blueText,
                ),
              ),
          ],
        ),
      ]
          .animate(
            interval: 100.ms,
          )
          .slideY(
            begin: 0.5,
            end: 0,
            curve: Curves.easeInOut,
          )
          .fadeIn(),
    );
  }
}

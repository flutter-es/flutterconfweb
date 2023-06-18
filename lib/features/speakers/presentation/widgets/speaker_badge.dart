import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.network(
                  speaker.photo!,
                  width: 100,
                  height: 100,
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
                ),
              ),
              FlutterConfLatamStyles.smallVGap,
              Text(speaker.company!, textAlign: TextAlign.center),
              FlutterConfLatamStyles.smallVGap,
              Text(speaker.title!, textAlign: TextAlign.center),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                for (var social in speaker.socialMediaLinks!)
                  IconButton(
                    onPressed: () {
                      Utils.launchUrlLink(social.link);
                    },
                    icon: Icon(
                      FlutterConfLatamIcons.getIconFromEnum(social.type),
                    ),
                  ),
              ])
            ],
          )),
    );
  }
}

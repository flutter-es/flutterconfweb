import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';

class SpeakerBadge extends StatefulWidget {

  Function? onSpeakerTap;
  final SpeakerModel speaker;

  SpeakerBadge({
    required this.speaker,
    this.onSpeakerTap,
    super.key,
  });

  @override
  State<SpeakerBadge> createState() => _SpeakerBadgeState();
}

class _SpeakerBadgeState extends State<SpeakerBadge> {

  Color hoverColor = Colors.transparent;
  Color inkWellBg = FlutterLatamColors.lightBlue.withOpacity(0.125);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: hoverColor,
      borderRadius: BorderRadius.circular(FlutterConfLatamStyles.mediumRadius),
      clipBehavior: Clip.antiAlias,
      child: MouseRegion(
          cursor: widget.onSpeakerTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
          child: InkWell(
            highlightColor: inkWellBg,
            splashColor: inkWellBg,
            onHover: widget.onSpeakerTap != null ? (value) {
              setState(() {
                hoverColor = value ? inkWellBg : Colors.transparent;
              });
            } : null,
            onTap: widget.onSpeakerTap != null ? () => widget.onSpeakerTap!(widget.speaker) : null,
            child: Container(
              color: Colors.transparent,
              width: 300,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: FlutterConfLatamStyles.largeSize,
                  horizontal: FlutterConfLatamStyles.mediumSize,
                ),
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.network(
                        widget.speaker.photo!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    FlutterConfLatamStyles.smallVGap,
                    Text(
                      widget.speaker.name!,
                      style: FlutterConfLatamStyles.h6,
                      textAlign: TextAlign.center,
                    ),
                    ClipOval(
                      child: Image.network(
                        widget.speaker.country!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (widget.speaker.company!.isNotEmpty)
                      FlutterConfLatamStyles.smallVGap
                    else 
                      const SizedBox.shrink(),
                    Text(widget.speaker.company!, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: Text(widget.speaker.title!, textAlign: TextAlign.center)),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      for (var social in widget.speaker.socialMediaLinks!)
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
            ),
        ),
      ),
    );
  }
}

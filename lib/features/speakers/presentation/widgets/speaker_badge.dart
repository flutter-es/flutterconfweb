import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/widgets/speaker_content.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpeakerBadge extends ConsumerStatefulWidget {
  SpeakerBadge({
    required this.speaker,
    this.onSpeakerTap,
    super.key,
  });

  Function? onSpeakerTap;
  final SpeakerModel speaker;

  @override
  ConsumerState<SpeakerBadge> createState() => _SpeakerBadgeState();
}

class _SpeakerBadgeState extends ConsumerState<SpeakerBadge> {
  Color hoverColor = Colors.transparent;
  Color inkWellBg = FlutterLatamColors.darkBlue.withOpacity(0.05);
  bool isSpeakerHovered = false;

  @override
  Widget build(BuildContext context) {
    final appLoc = ref.watch(appLocalizationsProvider);

    return Material(
      color: hoverColor,
      borderRadius: BorderRadius.circular(FlutterConfLatamStyles.mediumRadius),
      clipBehavior: Clip.antiAlias,
      child: MouseRegion(
        cursor: widget.onSpeakerTap != null
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: InkWell(
          highlightColor: inkWellBg,
          splashColor: inkWellBg,
          onHover: widget.onSpeakerTap != null
              ? (value) {
                  setState(() {
                    isSpeakerHovered = value;
                    hoverColor = value ? inkWellBg : Colors.transparent;
                  });
                }
              : null,
          onTap: widget.onSpeakerTap != null
              ? () => widget.onSpeakerTap!(widget.speaker)
              : null,
          child: Container(
            color: Colors.transparent,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.only(
                top: FlutterConfLatamStyles.largeSize,
                left: FlutterConfLatamStyles.mediumSize,
                right: FlutterConfLatamStyles.mediumSize,
                bottom: FlutterConfLatamStyles.mediumSize,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SpeakerContent(
                    isHovered: isSpeakerHovered,
                    speaker: widget.speaker,
                  ),
                  FlutterConfLatamStyles.smallVGap,
                  Opacity(
                    opacity: isSpeakerHovered ? 1 : 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterLatamColors.lightBlue.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(
                            FlutterConfLatamStyles.largeRadius),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: FlutterConfLatamStyles.largeSize,
                        vertical: FlutterConfLatamStyles.mediumSize,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.visibility, color: Colors.white),
                          FlutterConfLatamStyles.smallHGap,
                          Expanded(
                            child: Text(
                              appLoc.speakerBadgeMoreInfo,
                              textAlign: TextAlign.center,
                              style: FlutterConfLatamStyles.h7
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

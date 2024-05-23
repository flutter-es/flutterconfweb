import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_conf_colombia/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScheduleCellContent extends StatelessWidget {
  const ScheduleCellContent(
      {required this.session,
      required this.speakers,
      required this.onScheduleTap,
      super.key});

  final SessionModel session;
  final List<SpeakerModel> speakers;
  final VoidCallback onScheduleTap;

  @override
  Widget build(BuildContext context) {
    final sessionColor = Utils.getColorFromSessionType(session.sessionType);

    final showSpeakerImage = getValueForScreenType(
      context: context,
      mobile: true,
      tablet: true,
      desktop: true,
    );

    final showSpeakerName = getValueForScreenType(
      context: context,
      mobile: true,
      tablet: true,
      desktop: true,
    );

    final double cellPadding = getValueForScreenType(
      context: context,
      mobile: 18,
      tablet: 18,
      desktop: 16,
    );

    final double cellRadius = getValueForScreenType(
      context: context,
      mobile: 10,
      tablet: 10,
      desktop: 0,
    );

    final double bottomMargin = getValueForScreenType(
      context: context,
      mobile: 20,
      tablet: 20,
      desktop: 0,
    );

    final SizedBox speakerGap = getValueForScreenType(
      context: context,
      mobile: FlutterConfLatamStyles.smallVGap,
      tablet: FlutterConfLatamStyles.smallVGap,
    );

    final enableTabOnSession = session.sessionType != SessionType.eventSession;

    return MouseRegion(
      cursor: enableTabOnSession
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: () {
          if (enableTabOnSession) {
            onScheduleTap();
          }
        },
        child: Container(
          margin: EdgeInsets.only(bottom: bottomMargin),
          padding: EdgeInsets.all(cellPadding),
          decoration: BoxDecoration(
            color: Utils.getColorFromSessionType(session.sessionType),
            borderRadius: BorderRadius.circular(cellRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    session.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: FlutterConfLatamStyles.getStylesFromSessionType(
                        session.sessionType, context),
                  ),
                ],
              ),
              speakerGap,
              if (speakers.isNotEmpty)
                Wrap(
                  clipBehavior: Clip.antiAlias,
                  children: [
                    for (final speaker in speakers)
                      Visibility(
                        visible: showSpeakerImage,
                        child: Container(
                          margin: const EdgeInsets.only(
                            right: FlutterConfLatamStyles.mediumSize,
                            bottom: FlutterConfLatamStyles.mediumSize,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 3,
                                    color: sessionColor,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      speaker.photo!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              FlutterConfLatamStyles.xsmallHGap,
                              Visibility(
                                visible: showSpeakerName,
                                child: Text(
                                  speaker.name!,
                                  style: FlutterConfLatamStyles.label6,
                                ),
                              ),
                              FlutterConfLatamStyles.xsmallHGap,
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

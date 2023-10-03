import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_conf_colombia/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_colombia/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScheduleCellContent extends StatelessWidget {

  final SessionModel session;
  final List<SpeakerModel> speakers;

  const ScheduleCellContent({
    required this.session,
    required this.speakers,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    final sessionColor = Utils.getColorFromSessionType(session.sessionType);

    final showSpeakerImage = getValueForScreenType(context: context,
      mobile: true,
      tablet: false,
      desktop: true,
    );

    final showSpeaker = getValueForScreenType(context: context,
      mobile: true,
      tablet: false,
      desktop: true,
    );

    final showSessionDescription = getValueForScreenType(context: context,
      mobile: false,
      tablet: false,
      desktop: true,
    );

    final double cellPadding = getValueForScreenType(context: context,
      mobile: 18,
      tablet: 10,
      desktop: 16,
    );

    final double cellRadius = getValueForScreenType(context: context,
      mobile: 10,
      tablet: 0,
      desktop: 0,
    );

    final double bottomMargin = getValueForScreenType(context: context,
      mobile: 20,
      tablet: 0,
      desktop: 0,
    );

    final SizedBox speakerGap = getValueForScreenType(context: context,
      mobile: FlutterConfLatamStyles.smallVGap,
      tablet: null,
      desktop: null,
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          
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
                  Text(session.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: FlutterConfLatamStyles.getStylesFromSessionType(session.sessionType, context),
                  ),
                  Visibility(
                    visible: showSessionDescription,
                    child: Text(session.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              speakerGap,
              if (speakers.isNotEmpty)
                Wrap(
                  clipBehavior: Clip.antiAlias,
                  children: [
                    for(final speaker in speakers)
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
                                    width: 3, color: sessionColor,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      speaker.photo!,
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                ),
                              ),
                              FlutterConfLatamStyles.xsmallHGap,
                              Visibility(
                                visible: showSpeaker,
                                child: Text(speaker.name!, style: 
                                  FlutterConfLatamStyles.label6,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_colombia/features/sessions/presentation/widgets/session_metadata_container.dart';
import 'package:flutter_conf_colombia/features/sessions/presentation/widgets/session_tags_container.dart';
import 'package:flutter_conf_colombia/helpers/ui_extensions.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SessionMainContent extends StatelessWidget {
  const SessionMainContent(
      {required this.session,
      this.additionalTopContent,
      this.additionalBottomContent,
      super.key});

  final SessionModel session;
  final Widget? additionalTopContent;
  final Widget? additionalBottomContent;

  @override
  Widget build(BuildContext context) {
    final sessionHeader = getValueForScreenType(
      context: context,
      mobile: FlutterConfLatamStyles.h6,
      tablet: FlutterConfLatamStyles.h5,
      desktop: FlutterConfLatamStyles.h5,
    );

    final colChildren = [
      Text(session.title, textAlign: TextAlign.center, style: sessionHeader),
      FlutterConfLatamStyles.smallVGap,
      Text(session.description.cleanBreakLines(), textAlign: TextAlign.center),
      FlutterConfLatamStyles.smallVGap,
      Container(
        padding: FlutterConfLatamStyles.largePadding,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(FlutterConfLatamStyles.smallRadius),
          color: Colors.grey[100],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (additionalTopContent != null) additionalTopContent!,
            SessionMetadataContainer(
              session: session,
            ),
            FlutterConfLatamStyles.smallVGap,
            SessionTagsContainer(
              tags: session.tags,
            ),
            if (additionalBottomContent != null) additionalBottomContent!,
          ],
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: colChildren
          .animate(
            interval: 150.ms,
          )
          .slideY(
            begin: 0.25,
            end: 0,
            curve: Curves.easeInOut,
            duration: 0.5.seconds,
          )
          .fadeIn(
            curve: Curves.easeInOut,
            duration: 0.5.seconds,
          ),
    );
  }
}

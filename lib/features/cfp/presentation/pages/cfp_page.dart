import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/cfp/presentation/responsiveness/cfp_page_responsive_config.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/circleround_iconbutton.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CFPPage extends ConsumerWidget {

  static const String route = '/cfp';

  const CFPPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final uiConfig = CfpPageResponsiveConfig.getCfpPageResponsiveConfig(context);

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: uiConfig.pagePadding,
          child: Column(
            children: [
              Flex(
                direction: uiConfig.headerDirection,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FlutterConfLatamIcons.speaker, 
                    size: uiConfig.headerIconSize, 
                    color: FlutterLatamColors.blueText,
                  ),
                  uiConfig.headerGap,
                  Text('Call For Papers', 
                    textAlign: TextAlign.center, style: uiConfig.headerStyle,
                  ),
                ],
              ),
              uiConfig.pageVerticalGap,
              Text("The speakers at FlutterConf LATAM are a critical part in building a high energy event and encouraging discussions in the most important and interesting areas of Flutter. Please submit a paper if you have a new, exciting point of view or experience to share, if you want to actively collaborate on best practices, and if you're a fun personality that should be in front of the awesome FlutterConf LATAM audience. Please note, all presentations are live, in person, in Medellin, Colombia. (Funding is available to assist with travel.) Please share information about Flutter Heroes call for papers with your network - we want to reach deep within the community and build a diverse program that benefits all Flutter developers.",
                textAlign: TextAlign.center,
              ),
              uiConfig.pageVerticalGap,
              Text('Call for Papers Deadline', textAlign: TextAlign.center, style: uiConfig.deadlineHeaderStyle.copyWith(color: FlutterLatamColors.lightBlue)),
              Text('October 25th & 26th, 2023', textAlign: TextAlign.center, style: uiConfig.subheaderStyle),
              uiConfig.pageVerticalGap,
              CircleRoundIconButton(
                icon: FlutterConfLatamIcons.speaker,
                label: 'Submit your CFP',
                iconColor: Colors.white,
                backgroundColor: FlutterLatamColors.lightBlue,
                labelColor: Colors.white,
                circleColor: FlutterLatamColors.darkBlue,
                labelWeight: FontWeight.bold,
                fontSize: uiConfig.cfpButtonLabelSize,
                iconSize: uiConfig.cfpButtonIconSize,
                iconPadding: uiConfig.cfpButtonIconPadding,
                onTap: () {
                  Utils.launchUrlLink('');
                },
              ),
            ].animate(
              interval: 50.ms,
            ).slideY(
              begin: 1, end: 0,
              curve: Curves.easeInOut,
            ).fadeIn(),
          ),
        ),
      ),
    );
  }
}
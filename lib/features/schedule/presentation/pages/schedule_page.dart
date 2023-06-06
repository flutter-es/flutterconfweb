import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/responsiveness/schedule_page_responsive_config.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/comingsoon_container.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SchedulePage extends ConsumerWidget {

  static const String route = '/schedule';

  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final uiConfig = SchedulePageResponsiveConfig.getSchedulePageResponsiveConfig(context);

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
                    Icons.calendar_today,
                    size: uiConfig.headerIconSize, color: FlutterLatamColors.blueText,
                  ),
                  uiConfig.headerGap,
                  Text('Schedule', 
                    textAlign: TextAlign.center, 
                    style: uiConfig.headerStyle,
                  ),
                ],
              ),
              uiConfig.pageVerticalGap,
              Text("We are putting together an amazing agenda for you to enjoy and learn, full of great technical Flutter talks, imparted by a top-notch line-up of speakers at the top of their game!",
                textAlign: TextAlign.center,
              ),
              uiConfig.pageVerticalGap,
              Text('PLEASE CHECK BACK AGAIN SOON WHEN WE WILL HAVE THE FULL SCHEDULE AVAILABLE', textAlign: TextAlign.center,
                style: uiConfig.subheaderStyle
              ),
              uiConfig.pageVerticalGap,
              ComingSoonContainer()
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
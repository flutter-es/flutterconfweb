import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/responsiveness/schedule_page_responsive_config.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/comingsoon_container.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SchedulePage extends ConsumerWidget {

  static const String route = '/schedule';

  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appLoc = ref.watch(appLocalizationsProvider);
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
                  Text(appLoc.schedule, 
                    textAlign: TextAlign.center, 
                    style: uiConfig.headerStyle,
                  ),
                ],
              ),
              uiConfig.pageVerticalGap,
              ComingSoonContainer(),
              uiConfig.pageVerticalGap,
              Text(appLoc.schedulePageContent,
                textAlign: TextAlign.center,
              ),
              uiConfig.pageVerticalGap,
              Text(appLoc.schedulePageSubcontent, textAlign: TextAlign.center,
                style: uiConfig.subheaderStyle
              ),
              uiConfig.pageVerticalGap,
              
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
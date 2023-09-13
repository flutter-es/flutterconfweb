import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/providers/schedule_providers.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/responsiveness/schedule_content_responsive_config.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/responsiveness/schedule_page_responsive_config.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_day_block.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_date_selector.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_session.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_time_block.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/comingsoon_container.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SchedulePage extends ConsumerWidget {

  static const String route = '/schedule';

  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appLoc = ref.watch(appLocalizationsProvider);
    final uiConfig = ScheduleContentResponsiveConfig.getSchedulePageResponsiveConfig(context);
    final schedule = ref.watch(scheduleFutureProvider);

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: uiConfig.pagePadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              // const ComingSoonContainer(),
              // uiConfig.pageVerticalGap,
              // Text(appLoc.schedulePageContent,
              //   textAlign: TextAlign.center,
              // ),
              // uiConfig.pageVerticalGap,
              // Text(appLoc.schedulePageSubcontent, textAlign: TextAlign.center,
              //   style: uiConfig.subheaderStyle
              // ),
              // uiConfig.pageVerticalGap,
              schedule.when(
                data: (scheduleData) {

                  final scheduleSelectedDate = ref.watch(scheduleDaySelectionProvider);
                  final scheduleDayForSelection = scheduleSelectedDate != null ? scheduleData.where((s) => s.date == scheduleSelectedDate).first : scheduleData.first;
                  
                  return Column(
                    children: [
                      ScheduleDateSelector(
                        eventDates: scheduleData.map((s) => s.date).toList(),
                      ),
                      // Container(
                      //   margin: FlutterConfLatamStyles.mediumMargin.copyWith(
                      //     right: 0,
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         flex: uiConfig.timeFlexValue,
                      //         child: SizedBox.shrink()
                      //       ),
                      //       Expanded(
                      //         flex: uiConfig.contentFlexValue,
                      //         child: Row(
                      //           children: [
                      //             Expanded(
                      //               child: Container(
                      //                 decoration: BoxDecoration(
                      //                   color: Color.fromARGB(255, 203, 156, 0),
                      //                 ),
                      //                 margin: FlutterConfLatamStyles.mediumMargin.copyWith(
                      //                   bottom: 0,
                      //                   right: FlutterConfLatamStyles.mediumMargin.right / 3,
                      //                 ),
                      //                 padding: FlutterConfLatamStyles.mediumPadding,
                      //                 child: Text('Track 1', textAlign: TextAlign.center, style: FlutterConfLatamStyles.h6.copyWith(
                      //                   color: Colors.white
                      //                 )),
                      //               ),
                      //             ),
                      //             Expanded(
                      //               child: Container(
                      //                 decoration: BoxDecoration(
                                        
                      //                   color: Color.fromARGB(255, 203, 156, 0),
                      //                 ),
                      //                 margin: FlutterConfLatamStyles.mediumMargin.copyWith(
                      //                   bottom: 0,
                      //                   left: FlutterConfLatamStyles.mediumMargin.left / 3,
                      //                 ),
                      //                 padding: FlutterConfLatamStyles.mediumPadding,
                      //                 child: Text('Track 2', textAlign: TextAlign.center, style: FlutterConfLatamStyles.h6.copyWith(
                      //                   color: Colors.white
                      //                 )),
                      //               ),
                      //             )
                      //           ],
                      //         )
                      //       )
                      //     ],
                      //   ),
                      // ),
                      ScheduleDayBlock(
                        key: ValueKey(scheduleSelectedDate),
                        scheduleDay: scheduleDayForSelection,
                      ),
                    ],
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (error, stackTrace) {
                  return const Text('Error');
                },
              )
              
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
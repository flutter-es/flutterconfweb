import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_latam/features/schedule/presentation/providers/schedule_providers.dart';
import 'package:flutter_conf_latam/features/schedule/presentation/responsiveness/schedule_content_responsive_config.dart';
import 'package:flutter_conf_latam/features/schedule/presentation/widgets/schedule_date_selector.dart';
import 'package:flutter_conf_latam/features/schedule/presentation/widgets/schedule_day_block.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SchedulePage extends ConsumerWidget {
  const SchedulePage({super.key});

  static const String route = '/schedule';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = ref.watch(appLocalizationsProvider);
    final uiConfig =
        ScheduleContentResponsiveConfig.getSchedulePageResponsiveConfig(
          context,
        );
    final schedule = ref.watch(scheduleFutureProvider);

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: uiConfig.pagePadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:
                [
                      Flex(
                        direction: uiConfig.headerDirection,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: uiConfig.headerIconSize,
                            color: FlutterLatamColors.blueText,
                          ),
                          uiConfig.headerGap,
                          Text(
                            appLoc.schedule,
                            textAlign: TextAlign.center,
                            style: uiConfig.headerStyle,
                          ),
                        ],
                      ),
                      uiConfig.pageVerticalGap,
                      schedule.when(
                        data: (scheduleData) {
                          final scheduleSelectedDate = ref.watch(
                            scheduleDaySelectionProvider,
                          );
                          final scheduleDayForSelection =
                              scheduleSelectedDate != null
                                  ? scheduleData
                                      .where(
                                        (s) => s.date == scheduleSelectedDate,
                                      )
                                      .first
                                  : scheduleData.first;

                          return Column(
                            children: [
                              ScheduleDateSelector(
                                eventDates:
                                    scheduleData.map((s) => s.date).toList(),
                              ),
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
                      ),
                    ]
                    .animate(interval: 50.ms)
                    .slideY(begin: 1, end: 0, curve: Curves.easeInOut)
                    .fadeIn(),
          ),
        ),
      ),
    );
  }
}

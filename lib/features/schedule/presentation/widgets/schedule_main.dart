import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/container/error_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/option/option_button_list.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/features/schedule/domain/models/schedule_response_model.dart';
import 'package:flutter_conf_latam/features/schedule/presentation/view_model/schedule_view_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'schedule_main_dashboard.dart';

part 'schedule_main_dashboard_item.dart';

class ScheduleMain extends HookConsumerWidget {
  const ScheduleMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);

    return SectionContainer(
      spacing: 48,
      children: <Widget>[
        Padding(
          padding: .only(
            top: switch (context.screenSize) {
              .extraLarge || .large => 48,
              .normal || .small => 24,
            },
          ),
          child: TitleSubtitleText(
            title: (
              text: l10n.scheduleMainTitle,
              size: switch (context.screenSize) {
                .extraLarge => 64,
                .large => 48,
                .normal || .small => 24,
              },
            ),
            subtitle: (
              text: l10n.scheduleMainMessage,
              size: switch (context.screenSize) {
                .extraLarge || .large => 24,
                .normal || .small => 16,
              },
            ),
            spacing: switch (context.screenSize) {
              .extraLarge || .large => 24,
              .normal || .small => 12,
            },
          ),
        ),
        const _ScheduleDashboardContainer(),
      ],
    );
  }
}

class _ScheduleDashboardContainer extends HookConsumerWidget {
  const _ScheduleDashboardContainer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.theme.fclThemeScheme;
    final l10n = ref.watch(appLocalizationsProvider);

    final selectedSchedule = useState(0);
    final scheduleDays = [l10n.scheduleOptionDayOne, l10n.scheduleOptionDayTwo];

    return SizedBox(
      width: .infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: FlutterLatamColors.darkBlue,
          borderRadius: .circular(30),
        ),
        child: Padding(
          padding: switch (context.screenSize) {
            .extraLarge || .large => const .all(30),
            .normal || ScreenSize.small => const .all(20),
          },
          child: Column(
            spacing: 30,
            crossAxisAlignment: .start,
            children: <Widget>[
              OptionButtonList(
                options: scheduleDays,
                selectedValue: selectedSchedule.value,
                onChanged: (value) => selectedSchedule.value = value,
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: Text(
                  key: ValueKey(selectedSchedule.value),
                  l10n.scheduleOptionDayTitle(
                    selectedSchedule.value + 1,
                    scheduleDays[selectedSchedule.value],
                  ),
                  style: theme.typography.h4Bold.copyWith(
                    fontSize: switch (context.screenSize) {
                      .extraLarge || .large => 24,
                      .normal || .small => 16,
                    },
                  ),
                ),
              ),
              _ScheduleDashboard(
                currentIndex: selectedSchedule.value,
                duration: const Duration(milliseconds: 500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/providers/schedule_providers.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleDateSelector extends ConsumerWidget {

  const ScheduleDateSelector({
    required this.eventDates,
    super.key,
  });

  final List<DateTime> eventDates;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final selectedEventDate = ref.watch(scheduleDaySelectionProvider);
    final appLoc = ref.watch(appLocalizationsProvider);

    return Row(
      children: [
        ...List.generate(
          eventDates.length, (index) {
          
          
          final currentDate = eventDates[index];
          final dateSelected = selectedEventDate ?? eventDates.first;
          final bgColor = dateSelected == currentDate ? FlutterLatamColors.darkBlue : FlutterLatamColors.lightBlue;

          final borderRadius = index == 0 ? const BorderRadius.only(
                    topLeft: Radius.circular(FlutterConfLatamStyles.largeRadius),
                    bottomLeft: Radius.circular(FlutterConfLatamStyles.largeRadius),
                  ) : index == eventDates.length - 1 ? const BorderRadius.only(
                    topRight: Radius.circular(FlutterConfLatamStyles.largeRadius),
                    bottomRight: Radius.circular(FlutterConfLatamStyles.largeRadius),
                  ) : null;

            return Expanded(
                child: GestureDetector(
                  onTap: () {
                    ref.read(scheduleDaySelectionProvider.notifier).state = currentDate;
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: borderRadius,
                        color: bgColor,
                      ),
                      padding: FlutterConfLatamStyles.smallPadding,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('${appLoc.scheduleDay} ${index + 1}', style: FlutterConfLatamStyles.h5.copyWith(color: Colors.white)),
                          Text(ref.read(shortDateFormatterProvider(currentDate)), style: FlutterConfLatamStyles.h7.copyWith(color: Colors.white))
                        ],
                      ),
                    ),
                  ),
                ),
              ); 
          })
      ],
    );
  }
}

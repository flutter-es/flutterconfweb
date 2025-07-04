part of 'schedule_main.dart';

class _ScheduleDashboard extends HookConsumerWidget {
  const _ScheduleDashboard({
    required this.currentIndex,
    required this.duration,
  });

  final int currentIndex;
  final Duration duration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = useState(currentIndex);
    final controller = useAnimationController(duration: duration);

    useEffect(() {
      controller.forward();
      return null;
    }, const []);

    useEffect(() {
      if (index.value != currentIndex) {
        controller.forward(from: 0);
        Future.microtask(() => index.value = currentIndex);
      }
      return null;
    }, [currentIndex]);

    final scheduleDayList = ref.watch(daysScheduleProvider);
    return scheduleDayList.maybeWhen(
      data: (data) => FadeTransition(
        opacity: controller,
        child: IndexedStack(
          index: currentIndex,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: <Widget>[
            for (final daySchedule in data)
              if (daySchedule != null)
                Column(
                  spacing: 10,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    for (final item in daySchedule.slots)
                      _ScheduleSlotItem(slot: item),
                  ],
                ),
          ],
        ),
      ),
      error: (_, _) => Center(
        child: ErrorContainer(
          onRetry: () => ref.invalidate(daysScheduleProvider),
        ),
      ),
      orElse: Offstage.new,
    );
  }
}

class _ScheduleSlotItem extends StatelessWidget {
  const _ScheduleSlotItem({required this.slot});

  final ScheduleSlotModel slot;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        spacing: 10,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Column(
              spacing: 10,
              children: slot.scheduleSlots.others.entries.map((item) {
                return _ScheduleCardItem(
                  scheduleTracks: item.value,
                  color: switch (item.key.type) {
                    ScheduleType.register => const Color(0xFFB86EEE),
                    ScheduleType.keynote ||
                    ScheduleType.panel => const Color(0xFF0CCB98),
                    ScheduleType.breaks ||
                    ScheduleType.lunch => const Color(0xFFB86EEE),
                    ScheduleType.lighting => const Color(0xFFF779E2),
                    ScheduleType.session => const Color(0xFF147CE4),
                    ScheduleType.finish => const Color(0xFFCA4D4F),
                    _ => Colors.transparent,
                  },
                  position: slot.scheduleSlots.workshops.isNotEmpty
                      ? _ScheduleCardItemPosition.column
                      : switch (context.screenSize) {
                          ScreenSize.extraLarge ||
                          ScreenSize.large => _ScheduleCardItemPosition.row,
                          ScreenSize.normal ||
                          ScreenSize.small => _ScheduleCardItemPosition.column,
                        },
                );
              }).toList(),
            ),
          ),
          if (slot.scheduleSlots.workshops.isNotEmpty)
            Flexible(
              child: Column(
                spacing: 10,
                children: slot.scheduleSlots.workshops.entries.map((item) {
                  return Expanded(
                    child: _ScheduleCardItem(
                      scheduleTracks: item.value,
                      color: switch (item.key.type) {
                        ScheduleType.workshop => const Color(0xFFEDD079),
                        _ => Colors.transparent,
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}

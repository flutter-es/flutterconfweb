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
      unawaited(controller.forward());
      return null;
    }, const []);

    useEffect(() {
      if (index.value != currentIndex) {
        unawaited(controller.forward(from: 0));
        unawaited(Future.microtask(() => index.value = currentIndex));
      }
      return null;
    }, [currentIndex]);

    final scheduleDayList = ref.watch(daysScheduleProvider);
    return scheduleDayList.maybeWhen(
      data: (data) => FadeTransition(
        opacity: controller,
        child: IndexedStack(
          index: currentIndex,
          clipBehavior: .antiAliasWithSaveLayer,
          children: <Widget>[
            for (final (idx, daySchedule) in data.indexed)
              if (daySchedule != null)
                Visibility(
                  visible: currentIndex == idx,
                  child: Column(
                    spacing: 10,
                    mainAxisSize: .min,
                    children: <Widget>[
                      for (final item in daySchedule.slots)
                        _ScheduleSlotItem(slot: item),
                    ],
                  ),
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
            flex: switch (context.screenSize) {
              .small || .normal => 4,
              _ => 2,
            },
            child: Column(
              spacing: 10,
              children: slot.scheduleSlots.others.entries.map((item) {
                return _ScheduleCard(
                  sessions: item.value,
                  color: switch (item.key.type) {
                    .checkIn => FlutterLatamColors.purple,
                    .keynote || .panel => FlutterLatamColors.lightGreen,
                    .breaks || .lunch => FlutterLatamColors.purple,
                    .lighting => FlutterLatamColors.pink,
                    .session => FlutterLatamColors.blue,
                    .finish => FlutterLatamColors.mediumRed,
                    _ => Colors.transparent,
                  },
                  position: switch (context.screenSize) {
                    .extraLarge => .row,
                    _ => .column,
                  },
                  itemPosition: slot.scheduleSlots.workshopsHacks.isNotEmpty
                      ? .column
                      : switch (context.screenSize) {
                          .extraLarge || .large => .row,
                          .normal || .small => .column,
                        },
                );
              }).toList(),
            ),
          ),
          if (slot.scheduleSlots.workshopsHacks.isNotEmpty)
            Flexible(
              flex: switch (context.screenSize) {
                .small || .normal => 3,
                _ => 1,
              },
              child: Column(
                spacing: 10,
                children: slot.scheduleSlots.workshopsHacks.entries.map((item) {
                  return Expanded(
                    child: _ScheduleCard(
                      sessions: item.value,
                      color: switch (item.key.type) {
                        .workshop => FlutterLatamColors.lightYellow,
                        .hackathon => FlutterLatamColors.bronze,
                        _ => Colors.transparent,
                      },
                      position: .column,
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

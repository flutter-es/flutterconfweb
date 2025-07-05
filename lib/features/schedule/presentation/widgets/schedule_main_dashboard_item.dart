part of 'schedule_main.dart';

enum _ScheduleCardPosition { row, column }

enum _ScheduleCardItemPosition { row, column }

class _ScheduleCard extends ConsumerWidget {
  const _ScheduleCard({
    required this.scheduleTracks,
    required this.color,
    required this.position,
    this.itemPosition = _ScheduleCardItemPosition.column,
  });

  final List<ScheduleTrackModel> scheduleTracks;
  final Color color;
  final _ScheduleCardPosition position;
  final _ScheduleCardItemPosition itemPosition;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final scheduleTrack = scheduleTracks.firstOrNull;

    final scheduleChildren = <Widget>[
      for (final (index, item) in scheduleTracks.indexed) ...[
        switch (itemPosition) {
          _ScheduleCardItemPosition.column => _ScheduleDetail(
            scheduleTrack: item,
          ),
          _ScheduleCardItemPosition.row => _ScheduleDetail(scheduleTrack: item),
        },
        if (index < scheduleTracks.length - 1)
          switch (itemPosition) {
            _ScheduleCardItemPosition.column => const Divider(height: 30),
            _ScheduleCardItemPosition.row => const VerticalDivider(width: 30),
          },
      ],
    ];

    final scheduleCardChildren = <Widget>[
      if (scheduleTrack != null)
        Align(
          alignment: switch (scheduleTrack.type) {
            ScheduleType.workshop => Alignment.topLeft,
            _ => switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => Alignment.centerLeft,
              ScreenSize.normal || ScreenSize.small => Alignment.topLeft,
            },
          },
          child: Text(
            l10n.scheduleStartEndHour(
              scheduleTrack.startDate,
              scheduleTrack.endDate,
            ),
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: switch (context.screenSize) {
                ScreenSize.extraLarge || ScreenSize.large => 18,
                ScreenSize.normal || ScreenSize.small => 14,
              },
              fontWeight: FontWeight.w600,
              color: FlutterLatamColors.white,
            ),
          ),
        ),
      switch (itemPosition) {
        _ScheduleCardItemPosition.row => Row(
          mainAxisSize: MainAxisSize.min,
          children: scheduleChildren,
        ),
        _ScheduleCardItemPosition.column => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: scheduleChildren,
        ),
      },
    ];

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: color.withValues(alpha: .2),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: color, width: 1.5),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: switch (position) {
            _ScheduleCardPosition.row => Row(
              spacing: 40,
              children: scheduleCardChildren.mapIndexed((index, item) {
                return index == 0 ? item : Expanded(child: item);
              }).toList(),
            ),
            _ScheduleCardPosition.column => Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: scheduleCardChildren,
            ),
          },
        ),
      ),
    );
  }
}

class _ScheduleDetail extends ConsumerWidget {
  const _ScheduleDetail({required this.scheduleTrack});

  final ScheduleTrackModel scheduleTrack;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final scheduleChild = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: (scheduleTrack.title ?? '').isNotEmpty ? 10 : 20,
      children: <Widget>[
        Text(
          switch (scheduleTrack.type) {
            ScheduleType.register => l10n.scheduleRegisterTitle,
            ScheduleType.keynote => l10n.scheduleKeynoteTitle,
            ScheduleType.panel => l10n.schedulePanelTitle,
            ScheduleType.breaks => l10n.scheduleBreakTitle,
            ScheduleType.lunch => l10n.scheduleLunchTitle,
            ScheduleType.lighting => l10n.scheduleLightingTitle(
              scheduleTrack.track,
            ),
            ScheduleType.session => l10n.scheduleSessionTitle(
              scheduleTrack.track,
            ),
            ScheduleType.workshop => l10n.scheduleWorkshopTitle,
            ScheduleType.finish => l10n.scheduleFinishTitle,
          },
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => 14,
              ScreenSize.normal || ScreenSize.small => 12,
            },
            fontWeight: FontWeight.bold,
            color: FlutterLatamColors.white,
          ),
        ),
        if ((scheduleTrack.title ?? '').isNotEmpty)
          Text(
            scheduleTrack.title!,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: switch (context.screenSize) {
                ScreenSize.extraLarge || ScreenSize.large => 16,
                ScreenSize.normal || ScreenSize.small => 12,
              },
              fontWeight: FontWeight.w300,
              color: FlutterLatamColors.white,
            ),
          ),
        /*
        if ((scheduleTrack.speakers ?? []).isNotEmpty)
          Wrap(
            spacing: 30,
            runSpacing: 10,
            children: <Widget>[
              for (final speaker in scheduleTrack.speakers!)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: FlutterLatamColors.white,
                      backgroundImage: NetworkImage(speaker.imageUrl),
                    ),
                    Text(
                      speaker.name,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: switch (context.screenSize) {
                          ScreenSize.extraLarge || ScreenSize.large => 16,
                          ScreenSize.normal || ScreenSize.small => 14,
                        },
                        fontWeight: FontWeight.w300,
                        color: FlutterLatamColors.white,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        */
        if ((scheduleTrack.requirements ?? []).isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(
              l10n.scheduleRequirementTitle,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: switch (context.screenSize) {
                  ScreenSize.extraLarge || ScreenSize.large => 14,
                  ScreenSize.normal || ScreenSize.small => 12,
                },
                fontWeight: FontWeight.w600,
                color: FlutterLatamColors.white,
              ),
            ),
          ),
          for (final item in scheduleTrack.requirements!)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  '\u2022 ',
                  style: TextStyle(
                    fontSize: 14,
                    color: FlutterLatamColors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    item,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: switch (context.screenSize) {
                        ScreenSize.extraLarge || ScreenSize.large => 14,
                        ScreenSize.normal || ScreenSize.small => 12,
                      },
                      fontWeight: FontWeight.w400,
                      color: FlutterLatamColors.white,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ],
    );

    if (scheduleTrack.isTalkingTrack) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(child: scheduleChild),
      );
    }
    return scheduleChild;
  }
}

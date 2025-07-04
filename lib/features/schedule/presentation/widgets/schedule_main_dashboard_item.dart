part of 'schedule_main.dart';

enum _ScheduleCardItemPosition { row, column }

class _ScheduleCardItem extends ConsumerWidget {
  const _ScheduleCardItem({
    required this.scheduleTracks,
    required this.color,
    this.position = _ScheduleCardItemPosition.column,
  });

  final List<ScheduleTrackModel> scheduleTracks;
  final Color color;
  final _ScheduleCardItemPosition position;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final firstScheduleTrack = scheduleTracks.firstOrNull;

    final scheduleChildren = <Widget>[
      for (final (index, item) in scheduleTracks.indexed) ...[
        switch (position) {
          _ScheduleCardItemPosition.column => _ScheduleDetail(
            scheduleTrack: item,
          ),
          _ScheduleCardItemPosition.row => Expanded(
            child: _ScheduleDetail(scheduleTrack: item),
          ),
        },
        if (index < scheduleTracks.length - 1)
          switch (position) {
            _ScheduleCardItemPosition.column => const Divider(height: 30),
            _ScheduleCardItemPosition.row => const VerticalDivider(width: 30),
          },
      ],
    ];

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 1.5),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ResponsiveGrid(
            rowSizes: switch (firstScheduleTrack?.type) {
              ScheduleType.workshop => 2,
              _ => switch (context.screenSize) {
                ScreenSize.extraLarge || ScreenSize.large => 1,
                ScreenSize.normal || ScreenSize.small => 2,
              },
            },
            columnSizes: switch (firstScheduleTrack?.type) {
              ScheduleType.workshop => 1,
              _ => switch (context.screenSize) {
                ScreenSize.extraLarge || ScreenSize.large => 2,
                ScreenSize.normal || ScreenSize.small => 1,
              },
            },
            children: <Widget>[
              if (firstScheduleTrack != null)
                Align(
                  alignment: switch (firstScheduleTrack.type) {
                    ScheduleType.workshop => Alignment.topLeft,
                    _ => switch (context.screenSize) {
                      ScreenSize.extraLarge ||
                      ScreenSize.large => Alignment.centerLeft,
                      ScreenSize.normal ||
                      ScreenSize.small => Alignment.topLeft,
                    },
                  },
                  child: Text(
                    l10n.scheduleStartEndHour(
                      firstScheduleTrack.startDate,
                      firstScheduleTrack.endDate,
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
              switch (position) {
                _ScheduleCardItemPosition.row => Row(
                  children: scheduleChildren,
                ),
                _ScheduleCardItemPosition.column => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: scheduleChildren,
                ),
              },
            ],
          ),
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

    return Column(
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
                ScreenSize.normal || ScreenSize.small => 14,
              },
              fontWeight: FontWeight.w300,
              color: FlutterLatamColors.white,
            ),
          ),
        if ((scheduleTrack.speakers ?? []).isNotEmpty)
          Wrap(
            spacing: 30,
            runSpacing: 10,
            children: <Widget>[
              for (final speaker in scheduleTrack.speakers!)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey[300],
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
      ],
    );
  }
}

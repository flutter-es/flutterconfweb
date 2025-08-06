part of 'schedule_main.dart';

enum _ScheduleCardPosition { row, column }

enum _ScheduleCardItemPosition { row, column }

class _ScheduleCard extends ConsumerWidget {
  const _ScheduleCard({
    required this.sessions,
    required this.color,
    required this.position,
    this.itemPosition = _ScheduleCardItemPosition.column,
  });

  final List<ScheduleSessionModel> sessions;
  final Color color;
  final _ScheduleCardPosition position;
  final _ScheduleCardItemPosition itemPosition;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.theme.fclThemeScheme;

    final l10n = ref.watch(appLocalizationsProvider);
    final scheduleTrack = sessions.firstOrNull;

    final scheduleChildren = <Widget>[
      for (final (index, item) in sessions.indexed) ...[
        switch (itemPosition) {
          _ScheduleCardItemPosition.row => _ScheduleDetail(session: item),
          _ScheduleCardItemPosition.column => _ScheduleDetail(session: item),
        },
        if (index < sessions.length - 1)
          switch (itemPosition) {
            _ScheduleCardItemPosition.row => const VerticalDivider(width: 40),
            _ScheduleCardItemPosition.column => const Divider(height: 60),
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
            style: theme.typography.subH2Semibold.copyWith(
              fontSize: switch (context.screenSize) {
                ScreenSize.extraLarge || ScreenSize.large => 18,
                ScreenSize.normal || ScreenSize.small => 14,
              },
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
  const _ScheduleDetail({required this.session});

  final ScheduleSessionModel session;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.theme.fclThemeScheme;
    final l10n = ref.watch(appLocalizationsProvider);

    final scheduleTypeTitle = switch (session.type) {
      ScheduleType.register => l10n.scheduleRegisterTitle,
      ScheduleType.keynote => l10n.scheduleKeynoteTitle,
      ScheduleType.panel => l10n.schedulePanelTitle,
      ScheduleType.breaks => l10n.scheduleBreakTitle,
      ScheduleType.lunch => l10n.scheduleLunchTitle,
      ScheduleType.lighting => l10n.scheduleLightingTitle(session.track),
      ScheduleType.session => l10n.scheduleSessionTitle(session.track),
      ScheduleType.workshop => l10n.scheduleWorkshopTitle,
      ScheduleType.finish => l10n.scheduleFinishTitle,
    };

    final scheduleChild = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: (session.title ?? '').isNotEmpty ? 10 : 20,
      children: <Widget>[
        Text(
          scheduleTypeTitle,
          style: theme.typography.body4Regular.copyWith(
            fontSize: switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => 14,
              ScreenSize.normal || ScreenSize.small => 12,
            },
            fontWeight: FontWeight.bold,
          ),
        ),
        if ((session.title ?? '').isNotEmpty)
          Text(
            session.title!,
            style: theme.typography.body3Light.copyWith(
              fontSize: switch (context.screenSize) {
                ScreenSize.extraLarge || ScreenSize.large => 16,
                ScreenSize.normal || ScreenSize.small => 12,
              },
            ),
          ),
        if ((session.speakers ?? []).isNotEmpty)
          _ScheduleDetailSpeaker(speakers: session.speakers!),
      ],
    );

    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      onTap: session.isTalkingTrack ? () {} : null,
      child: Semantics(
        label: session.title ?? scheduleTypeTitle,
        role: session.isTalkingTrack
            ? SemanticsRole.spinButton
            : SemanticsRole.tooltip,
        child: scheduleChild,
      ),
    );
  }
}

class _ScheduleDetailSpeaker extends StatelessWidget {
  const _ScheduleDetailSpeaker({required this.speakers});

  final List<SessionSpeakerModel> speakers;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.fclThemeScheme;

    final children = speakers.map((item) {
      final childrenItem = <Widget>[
        CircleAvatar(
          radius: switch (context.screenSize) {
            ScreenSize.extraLarge || ScreenSize.large => 18,
            ScreenSize.normal => 14,
            ScreenSize.small => 10,
          },
          backgroundColor: FlutterLatamColors.white,
          backgroundImage: NetworkImage(item.imageUrl),
        ),
        Text(
          item.name,
          style: theme.typography.body3Light.copyWith(
            fontSize: switch (context.screenSize) {
              ScreenSize.extraLarge => 16,
              _ => 14,
            },
          ),
        ),
      ];

      return switch (context.screenSize) {
        ScreenSize.extraLarge || ScreenSize.large => Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: childrenItem.mapIndexed((index, item) {
            return index == 1 ? Flexible(child: item) : item;
          }).toList(),
        ),
        ScreenSize.normal || ScreenSize.small => Wrap(
          spacing: 8,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: childrenItem,
        ),
      };
    });

    return switch (context.screenSize) {
      ScreenSize.extraLarge => Row(
        spacing: 30,
        mainAxisSize: MainAxisSize.min,
        children: children.toList(),
      ),
      _ => Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: children.toList(),
      ),
    };
  }
}

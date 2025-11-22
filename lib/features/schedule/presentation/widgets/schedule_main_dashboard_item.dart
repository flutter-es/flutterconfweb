part of 'schedule_main.dart';

enum _ScheduleCardPosition { row, column }

enum _ScheduleCardItemPosition { row, column }

class _ScheduleCard extends ConsumerWidget {
  const _ScheduleCard({
    required this.sessions,
    required this.color,
    required this.position,
    this.itemPosition = .column,
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
          .row => Expanded(child: _ScheduleDetail(session: item)),
          .column => _ScheduleDetail(session: item),
        },
        if (index < sessions.length - 1)
          switch (itemPosition) {
            .row => const VerticalDivider(width: 40),
            .column => const Divider(height: 60),
          },
      ],
    ];

    final scheduleCardChildren = <Widget>[
      if (scheduleTrack != null)
        Align(
          alignment: switch (scheduleTrack.type) {
            .workshop => .topLeft,
            _ => switch (context.screenSize) {
              .extraLarge || .large => .centerLeft,
              .normal || .small => .topLeft,
            },
          },
          child: Text(
            l10n.scheduleStartEndHour(
              scheduleTrack.startDate,
              scheduleTrack.endDate,
            ),
            style: theme.typography.subH2Semibold.copyWith(
              fontSize: switch (context.screenSize) {
                .extraLarge || .large => 18,
                .normal || .small => 14,
              },
            ),
          ),
        ),
      switch (itemPosition) {
        .row => IntrinsicHeight(
          child: Row(mainAxisSize: .min, children: scheduleChildren),
        ),
        .column => Column(
          crossAxisAlignment: .start,
          children: scheduleChildren,
        ),
      },
    ];

    return Card(
      elevation: 0,
      margin: .zero,
      color: color.withValues(alpha: .2),
      clipBehavior: .antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: .circular(12),
        side: BorderSide(color: color, width: 1.5),
      ),
      child: SizedBox(
        width: .infinity,
        child: Padding(
          padding: const .all(20),
          child: switch (position) {
            .row => Row(
              spacing: 40,
              children: scheduleCardChildren.mapIndexed((index, item) {
                return index == 0 ? item : Expanded(child: item);
              }).toList(),
            ),
            .column => Column(
              spacing: 20,
              crossAxisAlignment: .start,
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
      .lighting => l10n.scheduleLightingTitle(session.track),
      .session => l10n.scheduleSessionTitle(session.track),
      .workshop => l10n.scheduleWorkshopTitle,
      _ => null,
    };
    final requirements = session.requirements ?? [];

    final scheduleChild = Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      spacing: session.title.isNotEmpty ? 10 : 20,
      children: <Widget>[
        Text(
          scheduleTypeTitle ?? session.title,
          style: theme.typography.body4Regular.copyWith(
            fontSize: switch (context.screenSize) {
              .extraLarge || .large => 14,
              .normal || .small => 12,
            },
            fontWeight: .bold,
          ),
        ),
        if (scheduleTypeTitle != null)
          Text(
            session.title,
            style: theme.typography.body3Light.copyWith(
              fontSize: switch (context.screenSize) {
                .extraLarge || .large => 16,
                .normal || .small => 12,
              },
            ),
          ),
        if ((session.speakers ?? []).isNotEmpty)
          _ScheduleDetailSpeaker(speakers: session.speakers!),
        if (requirements.isNotEmpty)
          Column(
            spacing: 4,
            crossAxisAlignment: .start,
            children: <Widget>[
              Text(
                l10n.scheduleRequirementTitle,
                style: switch (context.screenSize) {
                  .extraLarge || .large => theme.typography.body3Regular,
                  .normal || .small => theme.typography.body4Regular,
                },
              ),
              for (final item in requirements)
                Text(
                  '${'\u2022 '} $item',
                  style: switch (context.screenSize) {
                    .extraLarge || .large => theme.typography.body4Regular,
                    .normal || .small => theme.typography.captionRegular,
                  },
                ),
            ],
          ),
      ],
    );

    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      onTap: session.isTalkingTrack ? () {} : null,
      child: Semantics(
        label: scheduleTypeTitle != null
            ? '$scheduleTypeTitle: ${session.title}'
            : session.title,
        role: session.isTalkingTrack ? .spinButton : .tooltip,
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
            .extraLarge || .large => 18,
            .normal => 14,
            .small => 10,
          },
          backgroundColor: FlutterLatamColors.white,
          backgroundImage: NetworkImage(item.imageUrl),
        ),
        Text(
          item.name,
          style: theme.typography.body3Light.copyWith(
            fontSize: switch (context.screenSize) {
              .extraLarge => 16,
              _ => 14,
            },
          ),
        ),
      ];

      return switch (context.screenSize) {
        .extraLarge => Row(
          spacing: 8,
          mainAxisSize: .min,
          children: childrenItem,
        ),
        _ => Wrap(
          spacing: 8,
          runSpacing: 8,
          crossAxisAlignment: .center,
          children: childrenItem,
        ),
      };
    });

    return switch (context.screenSize) {
      .extraLarge => Wrap(
        spacing: 30,
        runSpacing: 8,
        children: children.toList(),
      ),
      _ => Column(
        spacing: 20,
        mainAxisSize: .min,
        children: children.toList(),
      ),
    };
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/l10n/gen/app_localizations.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CountDownText extends ConsumerStatefulWidget {
  const CountDownText({
    required this.startDate,
    required this.endDate,
    super.key,
  });

  final DateTime startDate;
  final DateTime endDate;

  @override
  ConsumerState<CountDownText> createState() => _CountDownTextState();
}

class _CountDownTextState extends ConsumerState<CountDownText> {
  Duration _duration = Duration.zero;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _duration = widget.endDate.difference(widget.startDate);
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(appLocalizationsProvider);
    final columnRowSize = switch (context.screenSize) {
      .extraLarge => 4,
      _ => 2,
    };

    final titleSize = switch (context.screenSize) {
      .extraLarge => 84.0,
      .large => 64.0,
      .normal || .small => 24.0,
    };

    final subtitleSize = switch (context.screenSize) {
      .extraLarge || .large => 24.0,
      .normal || .small => 20.0,
    };

    if (_duration <= Duration.zero) {
      return Center(
        child: TitleSubtitleText(
          title: (text: l10n.homeCountDownFinishTitle, size: titleSize),
          subtitle: (text: l10n.homeCountDownFinishMessage, size: subtitleSize),
        ),
      );
    }

    return ResponsiveGrid(
      rowSizes: columnRowSize,
      columnSizes: columnRowSize,
      children: <Widget>[
        for (final item in _formatDuration(_duration, l10n))
          Center(
            child: TitleSubtitleText(
              title: (text: item.value, size: titleSize),
              subtitle: (text: item.text, size: subtitleSize),
            ),
          ),
      ],
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _duration = _duration - const Duration(seconds: 1);
        if (_duration.inSeconds <= 0) {
          _timer?.cancel();
          _duration = Duration.zero;
        }
      });
    });
  }

  List<({String value, String text})> _formatDuration(
    Duration duration,
    AppLocalizations l10n,
  ) {
    final days = duration.inDays.toString();
    final hours = _twoDigits(duration.inHours.remainder(24));
    final minutes = _twoDigits(duration.inMinutes.remainder(60));
    final seconds = _twoDigits(duration.inSeconds.remainder(60));

    return [
      (value: days, text: l10n.homeCountDownDays),
      (value: hours, text: l10n.homeCountDownHours),
      (value: minutes, text: l10n.homeCountDownMinutes),
      (value: seconds, text: l10n.homeCountDownSeconds),
    ];
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');
}

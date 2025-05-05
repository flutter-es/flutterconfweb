import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/styles/colors.dart';

class CountDownText extends StatefulWidget {
  const CountDownText({
    required this.startDate,
    required this.endDate,
    super.key,
  });

  final DateTime startDate;
  final DateTime endDate;

  @override
  State<CountDownText> createState() => _CountDownTextState();
}

class _CountDownTextState extends State<CountDownText> {
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
    return Row(
      spacing: 100,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (final item in _formatDuration(_duration))
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                item.value,
                style: const TextStyle(
                  fontFamily: 'Recoleta',
                  fontSize: 84,
                  fontWeight: FontWeight.w900,
                  color: FlutterLatamColors.white,
                ),
              ),
              Text(
                item.text,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: FlutterLatamColors.white,
                ),
              ),
            ],
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

  List<({String value, String text})> _formatDuration(Duration duration) {
    final days = duration.inDays.toString();
    final hours = _twoDigits(duration.inHours.remainder(24));
    final minutes = _twoDigits(duration.inMinutes.remainder(60));
    final seconds = _twoDigits(duration.inSeconds.remainder(60));

    return [
      (value: days, text: 'días'),
      (value: hours, text: 'horas'),
      (value: minutes, text: 'minutos'),
      (value: seconds, text: 'segundos'),
    ];
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');
}

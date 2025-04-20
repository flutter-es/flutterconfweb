import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/features/schedule/presentation/providers/schedule_providers.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleTimeBlockTimeLabel extends ConsumerWidget {
  const ScheduleTimeBlockTimeLabel({required this.time, super.key});

  final DateTime time;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formattedTime = ref.read(timeFormatterProvider(time));

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.schedule_outlined,
          color: FlutterLatamColors.lightBlue,
        ),
        FlutterConfLatamStyles.xSmallHGap,
        Text(
          formattedTime,
          style: FlutterConfLatamStyles.h6.copyWith(
            color: FlutterLatamColors.lightBlue,
          ),
        ),
      ],
    );
  }
}

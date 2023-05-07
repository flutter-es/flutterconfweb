import 'package:flutter/material.dart';

class ScheduleContainer extends StatelessWidget {
  const ScheduleContainer({super.key});

  static const height = 600.0;

  static const title = 'schedule_container';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.green[400],
      alignment: Alignment.center,
      child: const Text(title),
    );
  }
}

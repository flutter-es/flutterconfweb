import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';

class ScheduleSessionRoomInfo extends StatelessWidget {

  const ScheduleSessionRoomInfo({
    required this.roomInfo,
    super.key
  });

  final String roomInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: FlutterConfLatamStyles.smallPadding,
      decoration: BoxDecoration(
        color: FlutterLatamColors.lightBlue.withOpacity(0.5),
        borderRadius: BorderRadius.circular(FlutterConfLatamStyles.xsmallRadius),
      ),
      child: Row(
        children: [
          const Icon(Icons.sensor_door_outlined),
          FlutterConfLatamStyles.xsmallHGap,
          Text(roomInfo, style: FlutterConfLatamStyles.h7.copyWith(
            color: Colors.black,
            ),
          ),
          FlutterConfLatamStyles.xsmallHGap,
        ],
      ),
    );
  }
}
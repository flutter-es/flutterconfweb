import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';

class ScheduleSessionAddToFavorite extends StatelessWidget {
  const ScheduleSessionAddToFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 0,
        shadowColor: Colors.transparent,
        foregroundColor: FlutterLatamColors.lightBlue,
        backgroundColor: FlutterLatamColors.lightBlue.withOpacity(0.1),
      ),
      onPressed: () {},
      child: Padding(
        padding: FlutterConfLatamStyles.smallPadding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add To My Favorites',
              style: FlutterConfLatamStyles.h7.copyWith(
                color: FlutterLatamColors.lightBlue,
              ),
            ),
            FlutterConfLatamStyles.xsmallHGap,
            const Icon(Icons.favorite_border_outlined,
                color: FlutterLatamColors.lightBlue),
          ],
        ),
      ),
    );
  }
}

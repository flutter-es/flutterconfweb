import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/home/presentation/providers/home_providers.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventFeaturesContainer extends ConsumerWidget {
  const EventFeaturesContainer({super.key});

  static const height = 400.0;

  static const title = 'event_features';

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final eventFeatures = ref.watch(eventFeaturesListProvider);

    return Container(
      height: height,
      color: FlutterLatamColors.eventFeaturesColor,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (final eventFeature in eventFeatures)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(eventFeature.icon, color: Colors.white, size: 80),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: Text(eventFeature.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
        ],
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/home/presentation/providers/home_providers.dart';
import 'package:flutter_conf_colombia/features/home/presentation/responsiveness/event_feature_responsive_config.dart';
import 'package:flutter_conf_colombia/features/home/presentation/widgets/event_features_wrapper.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventFeaturesContainer extends ConsumerWidget {
  const EventFeaturesContainer({super.key});

  static double height = 500.0;

  static const title = 'event_features';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventFeatures = ref.watch(eventFeaturesListProvider);

    final config =
        EventFeatureResponsiveConfig.getEventFeatureBannerConfig(context);

    EventFeaturesContainer.height = config.bannerHeight;

    return Container(
      height: height,
      padding: EdgeInsets.all(config.bannerPadding),
      color: FlutterLatamColors.eventFeaturesColor,
      alignment: Alignment.center,
      child: EventFeaturesWrapper(
        axis: config.childrenAxis,
        children: [
          for (final eventFeature in eventFeatures)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(eventFeature.icon, color: Colors.white, size: 80),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: Text(
                    eventFeature.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: config.labelSize,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

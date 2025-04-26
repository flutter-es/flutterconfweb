import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/features/home/presentation/providers/home_providers.dart';
import 'package:flutter_conf_latam/features/home/presentation/responsiveness/event_feature_responsive_config.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventFeaturesContainer extends ConsumerWidget {
  const EventFeaturesContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventFeatures = ref.watch(eventFeaturesListProvider);
    final config = EventFeatureResponsiveConfig.getEventFeatureBannerConfig(
      context,
    );

    return Container(
      height: config.bannerHeight,
      alignment: Alignment.center,
      color: FlutterLatamColors.eventFeaturesColor,
      padding: EdgeInsets.all(config.bannerPadding),
      child: _EventFeaturesWrapper(
        axis: config.childrenAxis,
        children: <Widget>[
          for (final eventFeature in eventFeatures)
            Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  eventFeature.icon,
                  color: FlutterLatamColors.white,
                  size: 80,
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    eventFeature.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: config.labelSize,
                      color: FlutterLatamColors.white,
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

class _EventFeaturesWrapper extends StatelessWidget {
  const _EventFeaturesWrapper({required this.children, required this.axis});

  final List<Widget> children;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return switch (axis) {
      Axis.horizontal => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: children,
      ),
      Axis.vertical => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: children,
      ),
    };
  }
}

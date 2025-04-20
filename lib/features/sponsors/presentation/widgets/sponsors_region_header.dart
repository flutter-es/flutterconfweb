import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/extensions/extension_methods.dart';
import 'package:flutter_conf_latam/helpers/enums.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SponsorsRegionHeader extends ConsumerWidget {
  const SponsorsRegionHeader({required this.level, super.key});

  final SponsorshipLevels level;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loc = ref.watch(appLocalizationsProvider);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      margin: FlutterConfLatamStyles.smallMargin,
      padding: FlutterConfLatamStyles.mediumPadding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: SizedBox.square(
              dimension: 20,
              child: ColoredBox(color: level.color),
            ),
          ),
          FlutterConfLatamStyles.smallHGap,
          Text(
            level.title(loc),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

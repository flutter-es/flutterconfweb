import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SponsorsRegionHeader extends ConsumerWidget {

  const SponsorsRegionHeader({
    required this.level,
    super.key,
  });

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
            child: Container(
              width: 20, height: 20,
              color: Utils.getColorFromSponsorshipLevel(level),
            ),
          ),
          FlutterConfLatamStyles.smallHGap,
          Text(Utils.getTitleFromSponsorshipLevel(loc, level), 
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

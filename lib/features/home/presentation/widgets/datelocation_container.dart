import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/features/home/presentation/providers/home_providers.dart';
import 'package:flutter_conf_latam/features/home/presentation/responsiveness/datelocation_responsive_config.dart';
import 'package:flutter_conf_latam/helpers/constants.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateLocationContainer extends ConsumerWidget {
  const DateLocationContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateLocData = ref.watch(dateLocationProvider);
    final uiConfig = DateLocationResponsiveConfig.getDateLocationBannerConfig(
      context,
    );

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('${Constants.imagesPath}/medellin.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      padding: FlutterConfLatamStyles.bannerPadding,
      child: Padding(
        padding: EdgeInsets.all(uiConfig.padding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              dateLocData.date,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: uiConfig.dateSize,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              dateLocData.location,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: uiConfig.locationSize,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              dateLocData.address,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: uiConfig.addressSize,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

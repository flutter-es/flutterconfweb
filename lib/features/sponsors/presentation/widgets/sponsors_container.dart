import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/providers/navigation_providers.dart';
import 'package:flutter_conf_colombia/features/sponsors/presentation/pages/sponsors_page.dart';
import 'package:flutter_conf_colombia/features/sponsors/presentation/responsiveness/sponsors_responsive.config.dart';
import 'package:flutter_conf_colombia/features/sponsors/presentation/widgets/sponsors_region.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SponsorsContainer extends ConsumerWidget {
  const SponsorsContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = ref.watch(appLocalizationsProvider);
    final uiConfig = SponsorsResponsiveConfig.getSponsorsBannerConfig(context);

    return Container(
      color: FlutterLatamColors.sponsorsBanner,
      padding: FlutterConfLatamStyles.bannerPadding,
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  appLoc.ourSponsors,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: uiConfig.titleSize,
                  ),
                ),
              ),
            ],
          ),
          FlutterConfLatamStyles.smallVGap,
          const SponsorsRegion(
            level: SponsorshipLevels.platinum,
          ),
          const SponsorsRegion(
            level: SponsorshipLevels.gold,
          ),
          const SponsorsRegion(
            level: SponsorshipLevels.silver,
          ),
          const SponsorsRegion(
            level: SponsorshipLevels.bronze,
          ),
          const SponsorsRegion(
            level: SponsorshipLevels.inkind,
          ),
          FlutterConfLatamStyles.smallVGap,
          ElevatedButton(
            onPressed: () {
              ref.read(navigationItemsProvider.notifier).selectNavItemFromRoute(SponsorsPage.route);
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: const StadiumBorder(),
              backgroundColor: FlutterLatamColors.brightYellow,
            ),
            child: Padding(
              padding: uiConfig.buttonPadding,
              child: Text(
                appLoc.becomeASponsor,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: uiConfig.buttonLabelSize,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

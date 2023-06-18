import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/providers/navigation_providers.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/circleround_iconbutton.dart';
import 'package:flutter_conf_colombia/features/sponsors/presentation/responsiveness/sponsors_page_responsive.config.dart';
import 'package:flutter_conf_colombia/features/sponsors/presentation/widgets/sponsors_list.dart';
import 'package:flutter_conf_colombia/features/sponsors/presentation/widgets/sponsors_region.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SponsorsPage extends ConsumerWidget {

  static const String route = '/sponsors';

  const SponsorsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appLoc = ref.watch(appLocalizationsProvider);
    final uiConfig = SponsorsPageResponsiveConfig.getSponsorsPageResponsiveConfig(context);

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: uiConfig.pagePadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flex(
                    direction: uiConfig.headerDirection,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.handshake,
                        size: uiConfig.headerIconSize,
                        color: FlutterLatamColors.blueText,
                      ),
                      uiConfig.headerGap,
                      Text(appLoc.sponsorsTitle, 
                        textAlign: TextAlign.center, 
                        style: uiConfig.headerStyle,
                      ),
                    ],
                  ),
                  uiConfig.pageVerticalGap,
                  Text(appLoc.sponsorsSubTitle,
                    textAlign: TextAlign.center,
                    style: uiConfig.subheaderStyle,
                  ),
                  uiConfig.pageVerticalGap,
                  Text(appLoc.sponsorsParagraphTop, textAlign: TextAlign.center),
                  uiConfig.pageVerticalGap,
                  CircleRoundIconButton(
                    icon: Icons.picture_as_pdf,
                    label: appLoc.sponsorPackageLinkLabel,
                    iconColor: Colors.white,
                    backgroundColor: FlutterLatamColors.brightYellow,
                    labelColor: Colors.black,
                    circleColor: FlutterLatamColors.burnedYellow,
                    labelWeight: FontWeight.bold,
                    iconSize: uiConfig.ticketButtonIconSize,
                    fontSize: uiConfig.ticketButtonLabelSize,
                    iconPadding: uiConfig.ticketButtonIconPadding,
                    onTap: () {
                    },
                  ),
                  uiConfig.pageVerticalGap,
                ],
              ),
            ),
            Container(
              color: FlutterLatamColors.sponsorsBanner,
              padding: FlutterConfLatamStyles.bannerPadding,
              alignment: Alignment.center,
              child: const SponsorsList(),
            ),
            Padding(
              padding: uiConfig.pagePadding,
              child: Column(
                children: [
                  Text(appLoc.sponsorsParagraphBottom, textAlign: TextAlign.center),
                  uiConfig.pageVerticalGap,
                  Text(appLoc.sponsorsInterestTitle,
                    textAlign: TextAlign.center,
                    style: uiConfig.subheaderStyle,
                  ),
                  uiConfig.pageVerticalGap,
                  CircleRoundIconButton(
                    icon: Icons.picture_as_pdf,
                    label: appLoc.sponsorPackageLinkLabel,
                    iconColor: Colors.white,
                    backgroundColor: FlutterLatamColors.brightYellow,
                    labelColor: Colors.black,
                    circleColor: FlutterLatamColors.burnedYellow,
                    labelWeight: FontWeight.bold,
                    iconSize: uiConfig.ticketButtonIconSize,
                    fontSize: uiConfig.ticketButtonLabelSize,
                    iconPadding: uiConfig.ticketButtonIconPadding,
                    onTap: () {
                      Utils.launchUrlLink('');
                    },
                  ),
                  uiConfig.pageVerticalGap,
                  Text(appLoc.sponsorsInterestContent, textAlign: TextAlign.center),
                ],
              ),
            )
          ].animate(
            interval: 50.ms,
          ).slideY(
            begin: 1, end: 0,
            curve: Curves.easeInOut,
          ).fadeIn(),
        ),
      ),
    );
  }
}
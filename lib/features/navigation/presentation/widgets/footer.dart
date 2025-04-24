import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/providers/navigation_provider.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/responsiveness/navigation_responsive_config.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class Footer extends ConsumerWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiConfig = NavigationResponsiveConfig.getNavigationConfig(context);

    final appLoc = ref.watch(appLocalizationsProvider);
    final socialMediaList = ref.read(socialMediaProvider);

    return ColoredBox(
      color: FlutterLatamColors.black,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: uiConfig.footerPadding,
          vertical: uiConfig.footerPadding,
        ),
        child: Flex(
          direction: uiConfig.footerLayoutDirection,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (uiConfig.showLogoOnFooter)
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    ref
                        .read(navigationViewmodelProvider.notifier)
                        .selectNavItemFromRoute(HomePage.route);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Icon(
                        FlutterConfLatamIcons.flutterConfLatamText,
                        color: FlutterLatamColors.white,
                        size: 40,
                      ),
                      const SizedBox(width: 15),
                      SizedBox.square(
                        dimension: 40,
                        child: SvgPicture.asset(Assets.images.flutterLogoWhite),
                      ),
                    ],
                  ),
                ),
              ),
            uiConfig.footerItemsGap,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                for (final social in socialMediaList)
                  IconButton(
                    onPressed: () => Utils.launchUrlLink(social.link),
                    icon: Icon(
                      social.icon,
                      color: FlutterLatamColors.white.withValues(alpha: .5),
                    ),
                  ),
              ],
            ),
            uiConfig.footerItemsGap,
            Center(
              child: Text(
                appLoc.copyright(DateTime.now().year),
                style: FlutterConfLatamStyles.label5.copyWith(
                  color: FlutterLatamColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

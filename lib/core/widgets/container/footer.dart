import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/providers/navigation_provider.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/responsiveness/navigation_responsive_config.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Footer extends ConsumerWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiConfig = NavigationResponsiveConfig.getNavigationConfig(context);

    final l10n = ref.watch(appLocalizationsProvider);
    final socialMediaList = ref.watch(socialMediaProvider);

    return ColoredBox(
      color: FlutterLatamColors.mainBlue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 64),
        child: Flex(
          direction: uiConfig.footerLayoutDirection,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: InkWell(
                    onTap: () {
                      ref
                          .read(navigationViewmodelProvider.notifier)
                          .selectNavItemFromRoute(HomePage.route);
                    },
                    child: Image.asset(Assets.images.fclEcFooterLogo),
                  ),
                ),
                Row(
                  spacing: 20,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    for (final social in socialMediaList)
                      InkWell(
                        onTap: () => Utils.launchUrlLink(social.link),
                        child: Icon(
                          social.icon,
                          size: 20,
                          color: FlutterLatamColors.white,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: Text(
                l10n.copyright(DateTime.now().year),
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

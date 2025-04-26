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

    final l10n = ref.watch(appLocalizationsProvider);
    final socialMediaList = ref.watch(socialMediaProvider);

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
            Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(navigationViewmodelProvider.notifier)
                          .selectNavItemFromRoute(HomePage.route);
                    },
                    child: Row(
                      spacing: 15,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(
                          FlutterConfLatamIcons.flutterConfLatamText,
                          color: FlutterLatamColors.white,
                          size: 40,
                        ),
                        SizedBox.square(
                          dimension: 40,
                          child: SvgPicture.asset(
                            Assets.images.flutterLogoWhite,
                          ),
                        ),
                      ],
                    ),
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
                          color: FlutterLatamColors.white.withValues(alpha: .5),
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

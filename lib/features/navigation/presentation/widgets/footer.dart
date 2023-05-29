import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/responsiveness/navigation_responsive_config.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/widgets/social_media_container.dart';
import 'package:flutter_conf_colombia/helpers/constants.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Footer extends ConsumerWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appLoc = ref.watch(appLocalizationsProvider);
    final uiConfig = NavigationResponsiveConfig.getNavigationConfig(context);
    Widget socialNetworks() => const SocialMediaContainer();

    Widget copyright() => Center(
          child: Text(
            appLoc.copyright,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        );

    Widget flutterConfLogo() => Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          FlutterConfLatamIcons.flutteconflatam_text,
          size: 40,
          color: Colors.white,
        ),
        const SizedBox(width: 15.0),
        SvgPicture.asset(
          '${Constants.imagesPath}/FlutterLogo_White.svg',
          width: 40,
          height: 40,
        ),
      ],
    );

    return ColoredBox(
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: uiConfig.footerPadding,
          vertical: uiConfig.footerPadding,
        ),
        child: Flex(
          direction: uiConfig.footerLayoutDirection,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (uiConfig.showLogoOnFooter) flutterConfLogo(),
            uiConfig.footerItemsGap,
            socialNetworks(),
            uiConfig.footerItemsGap,
            copyright(),
          ],
        ),
      ),
    );
  }
}

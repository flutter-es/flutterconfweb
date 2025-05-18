import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/routes/app_route_path.dart';
import 'package:flutter_conf_latam/core/routes/helpers/navigation_view_model.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/providers/navigation_provider.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Footer extends ConsumerWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);

    final paddingHorizontal = switch (context.screenSize) {
      ScreenSize.extraLarge => 122.0,
      ScreenSize.large => 72.0,
      ScreenSize.normal || ScreenSize.small => 28.0,
    };

    final paddingTop = switch (context.screenSize) {
      ScreenSize.extraLarge || ScreenSize.large => 96.0,
      ScreenSize.normal || ScreenSize.small => 48.0,
    };

    return Padding(
      padding: EdgeInsets.fromLTRB(
        paddingHorizontal,
        paddingTop,
        paddingHorizontal,
        28,
      ),
      child: Column(
        spacing: 64,
        children: <Widget>[
          const Divider(color: FlutterLatamColors.white),
          Flex(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: switch (context.screenSize) {
              ScreenSize.extraLarge => MainAxisAlignment.spaceBetween,
              _ => MainAxisAlignment.start,
            },
            spacing: switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => 100,
              ScreenSize.normal || ScreenSize.small => 48,
            },
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: switch (context.screenSize) {
              ScreenSize.extraLarge => Axis.horizontal,
              _ => Axis.vertical,
            },
            children: <Widget>[
              if (context.screenSize == ScreenSize.extraLarge) ...[
                const Expanded(child: _SocialFooter()),
                const Expanded(child: _SocialPlace()),
                const Expanded(child: _SocialVideos()),
              ] else ...[
                const _SocialFooter(),
                const _SocialPlace(),
                const _SocialVideos(),
              ],
            ],
          ),
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
    );
  }
}

class _SocialFooter extends ConsumerWidget {
  const _SocialFooter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socialMediaList = ref.watch(socialMediaProvider);

    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: InkWell(
            onTap: () => _goToHome(ref),
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
                child: SizedBox.square(
                  dimension: 24,
                  child: SvgPicture.asset(
                    social.iconPath,
                    colorFilter: const ColorFilter.mode(
                      FlutterLatamColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  void _goToHome(WidgetRef ref) {
    ref
        .read(navigationViewModelProvider.notifier)
        .selectNavItemFromRoute('/${AppRoutePath.home.pathName}');
  }
}

class _SocialPlace extends ConsumerWidget {
  const _SocialPlace();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final footerImages = <String>[
      Assets.images.footer.one,
      Assets.images.footer.two,
      Assets.images.footer.three,
    ];

    return Column(
      spacing: 30,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              l10n.footerTitle,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: FlutterLatamColors.white,
              ),
            ),
            Text(
              l10n.footerDescription,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: FlutterLatamColors.white,
              ),
            ),
          ],
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: <Widget>[
            for (final item in footerImages)
              SizedBox.fromSize(
                size: const Size(102, 126),
                child: Image.asset(item),
              ),
          ],
        ),
        InkWell(
          onTap: () {},
          child: Text(
            l10n.footerSeeMore,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: FlutterLatamColors.mediumBlue,
              decoration: TextDecoration.underline,
              decorationColor: FlutterLatamColors.mediumBlue,
            ),
          ),
        ),
      ],
    );
  }
}

class _SocialVideos extends ConsumerWidget {
  const _SocialVideos();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final videoList = <({String text, String url})>[
      (
        text: l10n.footerMemoriesVideoOne,
        url: 'https://www.youtube.com/watch?v=AroSepWRDMw',
      ),
      (
        text: l10n.footerMemoriesVideoTwo,
        url: 'https://www.youtube.com/watch?v=AQjO-V4xGis',
      ),
    ];

    return Column(
      spacing: 30,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              l10n.footerMemoriesTitle,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: FlutterLatamColors.white,
              ),
            ),
            Text(
              l10n.footerMemoriesDescription,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: FlutterLatamColors.white,
              ),
            ),
          ],
        ),
        ...[
          for (final item in videoList)
            Row(
              spacing: 10,
              children: <Widget>[
                SvgPicture.asset(Assets.images.icons.youtubeLogo),
                Expanded(
                  child: InkWell(
                    onTap: () => Utils.launchUrlLink(item.url),
                    child: Text(
                      item.text,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: FlutterLatamColors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: FlutterLatamColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ],
    );
  }
}

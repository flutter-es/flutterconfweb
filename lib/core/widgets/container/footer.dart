import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/routes/app_route_path.dart';
import 'package:flutter_conf_latam/core/routes/helpers/navigation_view_model.dart';
import 'package:flutter_conf_latam/core/social/models/social_media_model.dart';
import 'package:flutter_conf_latam/core/social/providers/social_media_provider.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/icons/social_media_row.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Footer extends ConsumerWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.theme.fclThemeScheme;
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
          const Divider(),
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
              style: theme.typography.h4Bold.copyWith(fontSize: 16),
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
    final socialMediaList = ref.watch(
      socialMediaProvider.select((value) => value.value ?? []),
    );

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
        SocialMediaRow(
          socialMediaList: socialMediaList.map((item) {
            final iconPath = switch (item.type) {
              SocialMediaType.youtube => Assets.images.icons.youtube,
              SocialMediaType.linkedIn => Assets.images.icons.linkedIn,
              SocialMediaType.tikTok => Assets.images.icons.tikTok,
              SocialMediaType.twitter => Assets.images.icons.twitter,
              SocialMediaType.facebook => Assets.images.icons.facebook,
              SocialMediaType.instagram => Assets.images.icons.instagram,
            };
            return (iconPath: iconPath, linkUrl: item.link);
          }).toList(),
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
    final theme = context.theme.fclThemeScheme;

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
              style: theme.typography.subH2Semibold,
            ),
            Text(
              l10n.footerDescription,
              style: theme.typography.body3Regular,
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
            style: theme.typography.buttonNormalMedium.copyWith(
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
    final theme = context.theme.fclThemeScheme;

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
              style: theme.typography.subH2Semibold,
            ),
            Text(
              l10n.footerMemoriesDescription,
              style: theme.typography.body3Regular,
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
                      style: theme.typography.body3Regular.copyWith(
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

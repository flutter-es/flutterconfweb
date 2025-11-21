import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/routes/app_route_path.dart';
import 'package:flutter_conf_latam/core/routes/helpers/navigation_view_model.dart';
import 'package:flutter_conf_latam/core/social/models/social_media_model.dart';
import 'package:flutter_conf_latam/core/social/providers/social_media_provider.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/icons/social_media_row.dart';
import 'package:flutter_conf_latam/core/widgets/text/data_protection_text.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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

    final paddingBottom = switch (context.screenSize) {
      ScreenSize.extraLarge || ScreenSize.large => 96.0,
      ScreenSize.normal || ScreenSize.small => 28.0,
    };

    final footerLinks = <({String text, String url})>[
      (
        text: l10n.footerTermsAndConditions,
        url: AppRoutePath.termsConditions.pathName,
      ),
      (
        text: l10n.footerPrivacyPolicy,
        url: AppRoutePath.privacyPolicy.pathName,
      ),
    ];

    final footerChildren = <Widget>[
      Text(
        l10n.footerCopyright(DateTime.now().year),
        style: theme.typography.body4Regular.copyWith(fontSize: 16),
      ),
      Column(
        spacing: 10,
        children: <Widget>[
          for (final item in footerLinks)
            InkWell(
              mouseCursor: SystemMouseCursors.click,
              onTap: () => context.go('/${item.url}'),
              child: Text(
                item.text,
                style: theme.typography.body4Regular.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: FlutterLatamColors.white,
                ),
              ),
            ),
        ],
      ),
    ];

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(
            paddingHorizontal,
            paddingTop,
            paddingHorizontal,
            paddingBottom,
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
                    const Expanded(flex: 2, child: _SocialFooter()),
                    const Expanded(child: _SocialVideos()),
                  ] else ...[
                    const _SocialFooter(),
                    const _SocialVideos(),
                  ],
                ],
              ),
              const Divider(),
              switch (context.screenSize) {
                ScreenSize.extraLarge || ScreenSize.large => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: footerChildren,
                ),
                ScreenSize.normal || ScreenSize.small => Column(
                  spacing: 16,
                  children: footerChildren,
                ),
              },
            ],
          ),
        ),
        Builder(
          builder: (_) {
            final paddingHorizontal = switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => 122.0,
              ScreenSize.normal || ScreenSize.small => 40.0,
            };

            final textAlign = switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => TextAlign.start,
              ScreenSize.normal || ScreenSize.small => TextAlign.center,
            };

            return ColoredBox(
              color: FlutterLatamColors.darkBlue,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: paddingHorizontal,
                  vertical: 32,
                ),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: switch (context.screenSize) {
                    ScreenSize.extraLarge ||
                    ScreenSize.large => CrossAxisAlignment.start,
                    ScreenSize.normal ||
                    ScreenSize.small => CrossAxisAlignment.center,
                  },
                  children: <Widget>[
                    Text(
                      l10n.footerDataProtectionTitle,
                      textAlign: textAlign,
                      style: theme.typography.body4Regular,
                    ),
                    DataProtectionText(textSize: 14, textAlign: textAlign),
                  ],
                ),
              ),
            );
          },
        ),
      ],
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox.fromSize(
          size: const Size(222, 167),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () => _goToHome(ref),
              child: SvgPicture.asset(Assets.images.fclMxMainLogo),
            ),
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

class _SocialVideos extends ConsumerWidget {
  const _SocialVideos();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.theme.fclThemeScheme;
    final l10n = ref.watch(appLocalizationsProvider);

    const youtubeUrl = 'https://www.youtube.com/watch';
    final videoList = <({String text, String url})>[
      (text: l10n.footerMemoriesVideoOne, url: '$youtubeUrl?v=FSRlBfMwoG8'),
      (text: l10n.footerMemoriesVideoTwo, url: '$youtubeUrl?v=AroSepWRDMw'),
      (text: l10n.footerMemoriesVideoThree, url: '$youtubeUrl?v=AQjO-V4xGis'),
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

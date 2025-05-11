import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/card/grid_card_item.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';

class HomeNovelties extends StatelessWidget {
  const HomeNovelties({super.key});

  @override
  Widget build(BuildContext context) {
    final novelties = <({String title, String description, String image})>[
      (
        title: 'Merch edición Ecuador',
        description: 'Swag único, stickers y más, solo para esta edición.',
        image: Assets.images.novelties.one,
      ),
      (
        title: '¿Amante de la trivia?',
        description: 'Estamos preparando algo que te va a encantar.',
        image: Assets.images.novelties.two,
      ),
    ];

    return SectionContainer(
      spacing: 60,
      children: <Widget>[
        Column(
          spacing: 30,
          children: <Widget>[
            TitleSubtitleText(
              title: (
                text: 'Novedades para este 2025',
                size: switch (context.screenSize) {
                  ScreenSize.extraLarge => 64,
                  ScreenSize.large => 48,
                  ScreenSize.normal || ScreenSize.small => 24,
                },
              ),
              subtitle: (
                text:
                    'Siempre hemos dado lo mejor, pero ahora queremos '
                    'ofrecerte una experiencia Flutter aún más completa.',
                size: switch (context.screenSize) {
                  ScreenSize.extraLarge || ScreenSize.large => 24,
                  ScreenSize.normal || ScreenSize.small => 16,
                },
              ),
              spacing: 12,
            ),
            ResponsiveGrid(
              columnSizes: switch (context.screenSize) {
                ScreenSize.extraLarge || ScreenSize.large => 2,
                ScreenSize.normal || ScreenSize.small => 1,
              },
              rowSizes: switch (context.screenSize) {
                ScreenSize.extraLarge || ScreenSize.large => 2,
                ScreenSize.normal || ScreenSize.small => novelties.length,
              },
              children: <Widget>[
                for (final item in novelties)
                  GridCardItem(
                    title: item.title,
                    description: item.description,
                    imagePath: item.image,
                  ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          height: switch (context.screenSize) {
            ScreenSize.extraLarge => 530,
            ScreenSize.large => 1040,
            ScreenSize.normal || ScreenSize.small => 760,
          },
          child: const _NoveltyAppCard(),
        ),
      ],
    );
  }
}

class _NoveltyAppCard extends StatelessWidget {
  const _NoveltyAppCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: FlutterLatamColors.freshBlue,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Flex(
          spacing: 10,
          direction: switch (context.screenSize) {
            ScreenSize.extraLarge => Axis.horizontal,
            _ => Axis.vertical,
          },
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                spacing: 60,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: switch (context.screenSize) {
                  ScreenSize.extraLarge => CrossAxisAlignment.start,
                  _ => CrossAxisAlignment.center,
                },
                children: <Widget>[
                  TitleSubtitleText(
                    title: (
                      text: '¡Este 2025 tendremos app oficial!',
                      size: switch (context.screenSize) {
                        ScreenSize.extraLarge => 48,
                        ScreenSize.large => 40,
                        ScreenSize.normal || ScreenSize.small => 24,
                      },
                    ),
                    subtitle: (
                      text:
                          'Todo lo que necesitas de FlutterConfLatam '
                          'ahora en la palma de tu mano.',
                      size: switch (context.screenSize) {
                        ScreenSize.extraLarge || ScreenSize.large => 24,
                        ScreenSize.normal || ScreenSize.small => 16,
                      },
                    ),
                    textAlign: switch (context.screenSize) {
                      ScreenSize.extraLarge => TextAlign.start,
                      _ => TextAlign.center,
                    },
                    crossAxisAlignment: switch (context.screenSize) {
                      ScreenSize.extraLarge => CrossAxisAlignment.start,
                      _ => CrossAxisAlignment.center,
                    },
                    spacing: 10,
                  ),
                  const _AppStoreSection(),
                ],
              ),
            ),
            Expanded(
              child: SizedBox.square(
                dimension: switch (context.screenSize) {
                  ScreenSize.extraLarge || ScreenSize.large => 390,
                  ScreenSize.normal || ScreenSize.small => 220,
                },
                child: Image.asset(Assets.images.novelties.dashMobile),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppStoreSection extends StatelessWidget {
  const _AppStoreSection();

  @override
  Widget build(BuildContext context) {
    final appLogoUrls = <({String imagePath, String url})>[
      (imagePath: Assets.images.novelties.appStore, url: ''),
      (imagePath: Assets.images.novelties.googlePlay, url: ''),
    ];

    return Column(
      spacing: 20,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: switch (context.screenSize) {
        ScreenSize.extraLarge => CrossAxisAlignment.start,
        _ => CrossAxisAlignment.center,
      },
      children: <Widget>[
        Text(
          'Próximamente:',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => 24,
              ScreenSize.normal || ScreenSize.small => 16,
            },
            fontWeight: FontWeight.w400,
            color: FlutterLatamColors.white,
          ),
        ),
        Flex(
          spacing: 20,
          direction: switch (context.screenSize) {
            ScreenSize.extraLarge => Axis.horizontal,
            _ => Axis.vertical,
          },
          children: <Widget>[
            for (final item in appLogoUrls)
              InkWell(
                onTap: () {},
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 300,
                    maxHeight: switch (context.screenSize) {
                      ScreenSize.extraLarge || ScreenSize.large => 90,
                      ScreenSize.normal || ScreenSize.small => 60,
                    },
                  ),
                  child: Image.asset(item.imagePath, fit: BoxFit.contain),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

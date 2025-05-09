import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/card/grid_card_item.dart';
import 'package:flutter_conf_latam/core/widgets/text/adaptable_text.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class HomeFeatureContainer extends StatelessWidget {
  const HomeFeatureContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final features = <({String title, String description, String image})>[
      (
        title: 'Aprende con expertos',
        description: 'Disfruta de charlas y workshops sobre Flutter, y más.',
        image: Assets.images.features.one,
      ),
      (
        title: 'Conecta con la comunidad',
        description: 'Conecta con gente que vibra igual que tú.',
        image: Assets.images.features.two,
      ),
      (
        title: 'Inspírate y crece',
        description:
            'Descubre ideas, herramientas y nuevas '
            'perspectivas para tus proyectos.',
        image: Assets.images.features.three,
      ),
      (
        title: 'Gana premios increíbles',
        description:
            'Participa en dinámicas, retos y sorteos... '
            '¡y gana tu propio Dash!',
        image: Assets.images.features.four,
      ),
    ];

    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: switch (context.screenSize) {
            ScreenSize.extraLarge => 122,
            ScreenSize.large => 72,
            ScreenSize.normal || ScreenSize.small => 28,
          },
          vertical: switch (context.screenSize) {
            ScreenSize.extraLarge || ScreenSize.large => 96,
            ScreenSize.normal || ScreenSize.small => 48,
          },
        ),
        child: Column(
          spacing: 30,
          children: <Widget>[
            TitleSubtitleText(
              title: (
                text: '¿Amas Flutter?',
                size: switch (context.screenSize) {
                  ScreenSize.extraLarge => 64,
                  ScreenSize.large => 48,
                  ScreenSize.normal || ScreenSize.small => 24,
                },
              ),
              subtitle: (
                text:
                    'Entonces no puedes perderte FlutterConf Latam 2025 '
                    'el evento donde aprendes, conectas y te inspiras.',
                size: switch (context.screenSize) {
                  ScreenSize.extraLarge || ScreenSize.large => 24,
                  ScreenSize.normal || ScreenSize.small => 16,
                },
              ),
              spacing: 12,
            ),
            Flex(
              spacing: 30,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: switch (context.screenSize) {
                ScreenSize.extraLarge => Axis.horizontal,
                _ => Axis.vertical,
              },
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: LayoutGrid(
                    rowGap: 30,
                    columnGap: 30,
                    autoPlacement: AutoPlacement.rowDense,
                    columnSizes: switch (context.screenSize) {
                      ScreenSize.extraLarge || ScreenSize.large => [1.fr, 1.fr],
                      ScreenSize.normal || ScreenSize.small => [1.fr],
                    },
                    rowSizes: switch (context.screenSize) {
                      ScreenSize.extraLarge || ScreenSize.large => [auto, auto],
                      ScreenSize.normal || ScreenSize.small => List.generate(
                        features.length,
                        (_) => auto,
                      ),
                    },
                    children: <Widget>[
                      for (final item in features)
                        GridCardItem(
                          title: item.title,
                          description: item.description,
                          imagePath: item.image,
                        ),
                    ],
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: const Color(0xFF016EE8),
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          spacing: 30,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Align(
                              child: SizedBox.square(
                                dimension: 150,
                                child: Image.asset(
                                  Assets.images.features.tickets,
                                ),
                              ),
                            ),
                            const AdaptableText(
                              r'¡Compra tu ticket desde $50 aquí!',
                              style: TextStyle(
                                fontFamily: 'Recoleta',
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: FlutterLatamColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

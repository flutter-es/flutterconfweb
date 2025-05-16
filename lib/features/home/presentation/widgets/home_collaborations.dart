import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/button/fcl_button.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';

class HomeCollaborations extends StatelessWidget {
  const HomeCollaborations({super.key});

  @override
  Widget build(BuildContext context) {
    final collaborations = <CollaborationItem>[
      CollaborationItem(
        title: '¿Quieres ser speaker?',
        description: 'Si lo tuyo es inspirar y enseñar, súmate como speaker',
        imagePath: Assets.images.collaborations.speaker,
        color: FlutterLatamColors.blue,
        button: (text: 'Ser speaker', function: _goToCfp),
      ),
      CollaborationItem(
        title: '¿Quieres colaborar como sponsor?',
        description:
            '¡Tu marca también puede ser parte de esta gran experiencia!',
        imagePath: Assets.images.collaborations.sponsor,
        color: FlutterLatamColors.green,
        button: (text: 'Ser sponsor', function: _goToTicket),
      ),
    ];

    return SectionContainer(
      spacing: 30,
      children: <Widget>[
        TitleSubtitleText(
          title: (
            text: '¿Quieres colaborar a otro nivel?',
            size: switch (context.screenSize) {
              ScreenSize.extraLarge => 64,
              ScreenSize.large => 48,
              ScreenSize.normal || ScreenSize.small => 24,
            },
          ),
          subtitle: (
            text:
                'Súmate como speaker o sponsor y forma parte del corazón '
                'de FlutterConf Latam 2025.',
            size: switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => 24,
              ScreenSize.normal || ScreenSize.small => 16,
            },
          ),
          spacing: 12,
        ),
        ResponsiveGrid(
          columnSizes: switch (context.screenSize) {
            ScreenSize.extraLarge => 2,
            _ => 1,
          },
          rowSizes: switch (context.screenSize) {
            ScreenSize.extraLarge || ScreenSize.large => 2,
            ScreenSize.normal || ScreenSize.small => collaborations.length,
          },
          children: <Widget>[
            for (final item in collaborations)
              _CollaborationCardItem(item: item),
          ],
        ),
      ],
    );
  }

  void _goToCfp() {
    Utils.launchUrlLink(
      'https://docs.google.com/forms/d/e/1FAIpQLSdXH_eT5yRm6-3TSr5gAZaQc57_jFLa0TmqGxPgWxrVE1uDBA/viewform',
    );
  }

  void _goToTicket() {
    Utils.launchUrlLink(
      'https://ti.to/flutterconflatam/flutterconflatam2025/with/early-bird',
    );
  }
}

class _CollaborationCardItem extends StatelessWidget {
  const _CollaborationCardItem({required this.item});

  final CollaborationItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: item.color,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(48),
        child: Flex(
          spacing: switch (context.screenSize) {
            ScreenSize.extraLarge || ScreenSize.large => 50,
            _ => 24,
          },
          direction: switch (context.screenSize) {
            ScreenSize.extraLarge || ScreenSize.large => Axis.horizontal,
            _ => Axis.vertical,
          },
          children: <Widget>[
            Expanded(
              flex: switch (context.screenSize) {
                ScreenSize.extraLarge || ScreenSize.large => 2,
                ScreenSize.normal || ScreenSize.small => 1,
              },
              child: Column(
                spacing: 30,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TitleSubtitleText(
                    title: (
                      text: item.title,
                      size: switch (context.screenSize) {
                        ScreenSize.extraLarge || ScreenSize.large => 32,
                        ScreenSize.normal || ScreenSize.small => 24,
                      },
                    ),
                    subtitle: (
                      text: item.description,
                      size: switch (context.screenSize) {
                        ScreenSize.extraLarge || ScreenSize.large => 18,
                        ScreenSize.normal || ScreenSize.small => 16,
                      },
                    ),
                    textAlign: TextAlign.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                  ),
                  FclButton.secondary(
                    label: item.button.text,
                    onPressed: item.button.function,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox.square(
                dimension: 150,
                child: Image.asset(item.imagePath),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CollaborationItem {
  CollaborationItem({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.color,
    required this.button,
  });

  final String title;
  final String description;
  final String imagePath;
  final Color color;
  final ({String text, VoidCallback function}) button;
}

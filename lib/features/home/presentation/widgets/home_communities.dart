import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCommunities extends StatelessWidget {
  const HomeCommunities({super.key});

  @override
  Widget build(BuildContext context) {
    final communities = <({String image, String url})>[
      (image: Assets.images.sponsors.flutterLogo, url: ''),
      (image: Assets.images.sponsors.flutterLogo, url: ''),
      (image: Assets.images.sponsors.flutterLogo, url: ''),
      (image: Assets.images.sponsors.flutterLogo, url: ''),
      (image: Assets.images.sponsors.flutterLogo, url: ''),
      (image: Assets.images.sponsors.flutterLogo, url: ''),
    ];

    return SectionContainer(
      spacing: 30,
      children: <Widget>[
        TitleSubtitleText(
          title: (
            text: 'Hecho con y para la comunidad',
            size: switch (context.screenSize) {
              ScreenSize.extraLarge => 64,
              ScreenSize.large => 48,
              ScreenSize.normal || ScreenSize.small => 24,
            },
          ),
          subtitle: (
            text:
                'Este evento no sería lo mismo sin el corazón de Flutter: '
                '¡las comunidades que lo hacen posible!',
            size: switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => 24,
              ScreenSize.normal || ScreenSize.small => 16,
            },
          ),
          spacing: 12,
        ),
        ResponsiveGrid(
          columnSizes: switch (context.screenSize) {
            ScreenSize.extraLarge => 3,
            ScreenSize.large => 2,
            _ => 1,
          },
          rowSizes: switch (context.screenSize) {
            ScreenSize.extraLarge => 3,
            ScreenSize.large => (communities.length / 2).toInt(),
            _ => communities.length,
          },
          children: <Widget>[
            for (final item in communities)
              InkWell(
                onTap: () => Utils.launchUrlLink(item.url),
                child: SizedBox.fromSize(
                  size: switch (context.screenSize) {
                    ScreenSize.extraLarge ||
                    ScreenSize.large => const Size.fromHeight(105),
                    _ => const Size.fromHeight(54),
                  },
                  child: SvgPicture.asset(item.image),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

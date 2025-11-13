import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/container/keep_alive_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/images/carousel_images.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GalleryMain extends ConsumerWidget {
  const GalleryMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final carouselImageUrls = <String>[
      Assets.images.gallery.one,
      Assets.images.gallery.two,
      Assets.images.gallery.three,
    ];

    return KeepAliveContainer(
      child: SectionContainer(
        spacing: 48,
        children: <Widget>[
          CarouselImages(images: carouselImageUrls),
          TitleSubtitleText(
            title: (
              text: l10n.galleryMainTitle,
              size: switch (context.screenSize) {
                ScreenSize.extraLarge => 64,
                ScreenSize.large => 48,
                ScreenSize.normal || ScreenSize.small => 24,
              },
            ),
            subtitle: (
              text: l10n.galleryMainMessage,
              size: switch (context.screenSize) {
                ScreenSize.extraLarge || ScreenSize.large => 24,
                ScreenSize.normal || ScreenSize.small => 16,
              },
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}

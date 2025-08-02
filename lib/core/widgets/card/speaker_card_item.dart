import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/images/character_image.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/features/speakers/domain/models/speaker_model.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpeakerCardItem extends StatelessWidget {
  const SpeakerCardItem({
    required this.speaker,
    required this.imageSize,
    this.imageBackgroundColor,
    super.key,
  });

  final SpeakerModel speaker;
  final Size imageSize;
  final Color? imageBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final socialLinks = speaker.socialMediaLinks.where(
      (item) => item.link.isNotEmpty,
    );

    final imageChild = CharacterImage(
      imageUrl: imageBackgroundColor != null
          ? speaker.photoTransparent
          : speaker.photo,
      flagImageUrl: speaker.countryFlag,
      size: imageSize,
    );

    return Center(
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (imageBackgroundColor != null)
            DecoratedBox(
              decoration: BoxDecoration(
                color: imageBackgroundColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: imageChild,
            )
          else
            imageChild,
          TitleSubtitleText(
            title: (
              text: speaker.name,
              size: switch (context.screenSize) {
                ScreenSize.extraLarge || ScreenSize.large => 24,
                ScreenSize.normal || ScreenSize.small => 12,
              },
            ),
            subtitle: (
              text: speaker.title,
              size: switch (context.screenSize) {
                ScreenSize.extraLarge || ScreenSize.large => 16,
                ScreenSize.normal || ScreenSize.small => 12,
              },
            ),
            spacing: 4,
          ),
          Row(
            spacing: 20,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (final item in socialLinks)
                SizedBox.square(
                  dimension: 24,
                  child: InkWell(
                    onTap: () => Utils.launchUrlLink(item.link),
                    child: SvgPicture.asset(switch (item.type) {
                      SocialMedia.linkedin => Assets.images.icons.linkedIn,
                      SocialMedia.github => Assets.images.icons.github,
                      SocialMedia.twitter => Assets.images.icons.twitter,
                    }),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

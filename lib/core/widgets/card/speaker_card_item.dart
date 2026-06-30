import 'package:flutter/material.dart';
import 'package:flutter_conf_core/flutter_conf_core.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/icons/social_media_row.dart';
import 'package:flutter_conf_latam/core/widgets/images/character_image.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';

class SpeakerCardItem extends StatelessWidget {
  const SpeakerCardItem({
    required this.speaker,
    required this.imageSize,
    this.imageBackgroundColor,
    super.key,
  });

  final SpeakerEntity speaker;
  final Size imageSize;
  final Color? imageBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final user = speaker.user;
    final socialLinks = (user.socialLinks ?? []).where(
      (item) => item.url.isNotEmpty,
    );

    final imageChild = CharacterImage(
      imageUrl: imageBackgroundColor != null
          ? user.avatarTransparentUrl ?? ''
          : user.avatarUrl ?? '',
      flagImageUrl: user.countryFlag ?? '',
      size: imageSize,
    );

    return Center(
      child: Column(
        spacing: 20,
        mainAxisSize: .min,
        children: <Widget>[
          if (imageBackgroundColor != null)
            DecoratedBox(
              decoration: BoxDecoration(
                color: imageBackgroundColor,
                borderRadius: .circular(30),
              ),
              child: imageChild,
            )
          else
            imageChild,
          TitleSubtitleText(
            title: (
              text: user.name,
              size: switch (context.screenSize) {
                .extraLarge || .large => 24,
                .normal || .small => 12,
              },
            ),
            subtitle: (
              text: user.jobTitle ?? '',
              size: switch (context.screenSize) {
                .extraLarge || .large => 16,
                .normal || .small => 12,
              },
            ),
            spacing: 4,
          ),
          SocialMediaRow(
            socialMediaList: socialLinks.map((item) {
              final iconPath = switch (item.type) {
                .linkedin => Assets.images.icons.linkedIn,
                .github => Assets.images.icons.github,
                .twitter => Assets.images.icons.twitter,
                _ => Assets.images.icons.twitter,
              };
              return (iconPath: iconPath, linkUrl: item.url);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

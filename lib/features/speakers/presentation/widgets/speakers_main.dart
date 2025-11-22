import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/card/speaker_card_item.dart';
import 'package:flutter_conf_latam/core/widgets/container/error_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/keep_alive_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/shimmer_container.dart';
import 'package:flutter_conf_latam/core/widgets/icons/social_media_row.dart';
import 'package:flutter_conf_latam/core/widgets/images/single_image.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/features/speakers/presentation/view_model/speakers_view_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SpeakersMain extends ConsumerWidget {
  const SpeakersMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final speakers = ref.watch(speakersProvider(Locale(l10n.localeName)));

    final size = switch (context.screenSize) {
      .extraLarge || .large => const Size.square(206),
      .normal || .small => const Size.square(120),
    };

    return KeepAliveContainer(
      child: SectionContainer(
        spacing: 30,
        children: <Widget>[
          TitleSubtitleText(
            title: (
              text: l10n.speakersTitle,
              size: switch (context.screenSize) {
                .extraLarge => 64,
                .large => 48,
                .normal || .small => 24,
              },
            ),
            subtitle: (
              text: l10n.speakersDescription,
              size: switch (context.screenSize) {
                .extraLarge || .large => 24,
                .normal || .small => 16,
              },
            ),
            spacing: 12,
          ),
          speakers.when(
            data: (data) => _SpeakerListContainer(
              children: <Widget>[
                for (final item in data)
                  SpeakerCardItem(speaker: item, imageSize: size, isMain: true),
              ],
            ),
            loading: () => Shimmer(
              child: _SpeakerListContainer(
                children: .generate(12, (_) {
                  return Center(
                    child: ShimmerLoading(
                      isLoading: true,
                      child: Column(
                        spacing: 20,
                        children: <Widget>[
                          SingleImageContainer(size: size, borderRadius: 30),
                          const TitleSubtitleTextContainer(),
                          const SocialMediaRowContainer(),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            error: (_, _) => ErrorContainer(
              onRetry: () => ref.invalidate(
                speakersProvider(Locale(l10n.localeName)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SpeakerListContainer extends StatelessWidget {
  const _SpeakerListContainer({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colSize = switch (context.screenSize) {
      .extraLarge => 4,
      _ => 2,
    };

    return ResponsiveGrid(
      columnSizes: colSize,
      rowSizes: (children.length / colSize).ceil(),
      children: children,
    );
  }
}

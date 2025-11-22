import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/container/error_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/shimmer_container.dart';
import 'package:flutter_conf_latam/core/widgets/images/character_image.dart';
import 'package:flutter_conf_latam/core/widgets/images/single_image.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/features/speakers/presentation/view_model/speakers_view_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SpeakerDetailMain extends ConsumerWidget {
  const SpeakerDetailMain({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final parameter = (id: id, locale: Locale(l10n.localeName));

    final speaker = ref.watch(speakerProvider(parameter));

    return speaker.when(
      data: (data) => _SpeakerDetailContainer(
        headerChildren: <Widget>[
          CharacterImage(
            imageUrl: data.photo,
            flagImageUrl: data.countryFlag,
            size: const .square(120),
          ),
          Expanded(
            child: TitleSubtitleText(
              title: (
                text: data.name,
                size: switch (context.screenSize) {
                  .extraLarge || .large => 24,
                  .normal || .small => 22,
                },
              ),
              subtitle: (
                text: data.title,
                size: switch (context.screenSize) {
                  .extraLarge || .large => 16,
                  .normal || .small => 14,
                },
              ),
              spacing: 4,
              textAlign: .start,
              crossAxisAlignment: .start,
            ),
          ),
        ],
        detailChild: switch (context.screenSize) {
          .extraLarge || .large => _SpeakerDescription(
            text: data.description ?? '',
            hasSize: true,
          ),
          .normal || .small => _SpeakerDescription(
            text: data.description ?? '',
          ),
        },
      ),
      loading: () => const Shimmer(
        child: _SpeakerDetailContainer(
          headerChildren: <Widget>[
            ShimmerLoading(
              isLoading: true,
              child: SingleImageContainer(
                size: .square(120),
                borderRadius: 30,
              ),
            ),
            ShimmerLoading(
              isLoading: true,
              child: TitleSubtitleTextContainer(crossAxisAlignment: .start),
            ),
          ],
          detailChild: ShimmerLoading(
            isLoading: true,
            child: _SpeakerDescription.loading(),
          ),
        ),
      ),
      error: (_, _) => Center(
        child: ErrorContainer(
          onRetry: () => ref.invalidate(speakerProvider(parameter)),
        ),
      ),
    );
  }
}

class _SpeakerDescription extends StatelessWidget {
  const _SpeakerDescription({required String this.text, this.hasSize = false});

  const _SpeakerDescription.loading() : text = null, hasSize = false;

  final String? text;
  final bool hasSize;

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      final loadingSizes = <({double width, double height})>[
        (width: .infinity, height: 24),
        (width: .infinity, height: 24),
        (width: 250, height: 24),
      ];

      return Column(
        spacing: 16,
        crossAxisAlignment: .start,
        children: <Widget>[
          for (final item in loadingSizes)
            SizedBox.fromSize(
              size: Size(item.width, item.height),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: FlutterLatamColors.darkBlue,
                  borderRadius: .circular(16),
                ),
              ),
            ),
        ],
      );
    }

    final theme = context.theme.fclThemeScheme;
    final child = Text(text!, style: theme.typography.body3Regular);

    if (!hasSize) return child;
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 200, maxHeight: 400),
      child: SingleChildScrollView(child: child),
    );
  }
}

class _SpeakerDetailContainer extends StatelessWidget {
  const _SpeakerDetailContainer({
    required this.headerChildren,
    required this.detailChild,
  });

  final List<Widget> headerChildren;
  final Widget detailChild;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .all(36),
      child: Column(
        spacing: 20,
        mainAxisSize: .min,
        children: <Widget>[
          Row(spacing: 20, children: headerChildren),
          Flexible(child: detailChild),
        ],
      ),
    );
  }
}

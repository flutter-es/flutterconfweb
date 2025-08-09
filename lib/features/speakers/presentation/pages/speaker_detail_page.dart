import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/container/error_container.dart';
import 'package:flutter_conf_latam/core/widgets/icons/circle_icon.dart';
import 'package:flutter_conf_latam/core/widgets/images/character_image.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/features/speakers/presentation/view_model/speakers_view_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SpeakerDetailPage extends ConsumerStatefulWidget {
  const SpeakerDetailPage({required this.id, super.key});

  final String id;

  @override
  ConsumerState<SpeakerDetailPage> createState() => _SpeakerDetailPageState();
}

class _SpeakerDetailPageState extends ConsumerState<SpeakerDetailPage> {
  final analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    analytics.logScreenView(
      screenName: 'speakers_detail_page',
      parameters: <String, Object>{'speakerId': widget.id},
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(appLocalizationsProvider);
    final parameter = (id: widget.id, locale: Locale(l10n.localeName));

    final speaker = ref.watch(speakerProvider(parameter));

    return Material(
      color: FlutterLatamColors.darkBlue,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: <Widget>[
            speaker.when(
              data: (data) {
                return Padding(
                  padding: const EdgeInsets.all(36),
                  child: Column(
                    spacing: 20,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        spacing: 20,
                        children: <Widget>[
                          CharacterImage(
                            imageUrl: data.photo,
                            flagImageUrl: data.countryFlag,
                            size: const Size.square(120),
                          ),
                          _SpeakerMainDetail(
                            name: data.name,
                            title: data.title,
                          ),
                        ],
                      ),
                      Flexible(
                        child: switch (context.screenSize) {
                          ScreenSize.extraLarge ||
                          ScreenSize.large => _SpeakerDescription(
                            text: data.description ?? '',
                            hasSize: true,
                          ),
                          ScreenSize.normal ||
                          ScreenSize.small => _SpeakerDescription(
                            text: data.description ?? '',
                          ),
                        },
                      ),
                    ],
                  ),
                );
              },
              loading: () {
                // TODO(FV): change
                return const Offstage();
              },
              error: (_, _) => Center(
                child: ErrorContainer(
                  onRetry: () => ref.invalidate(speakerProvider(parameter)),
                ),
              ),
            ),
            switch (context.screenSize) {
              ScreenSize.extraLarge ||
              ScreenSize.large => const _CloseButton(hasSize: true),
              ScreenSize.normal ||
              ScreenSize.small => const _CloseButton(hasSize: false),
            },
          ],
        ),
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({required this.hasSize});

  final bool hasSize;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: hasSize ? 20 : 0,
      right: 20,
      child: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: const CircleIcon(
          child: Icon(Icons.close, color: FlutterLatamColors.white),
        ),
      ),
    );
  }
}

class _SpeakerMainDetail extends StatelessWidget {
  const _SpeakerMainDetail({required this.name, required this.title});

  final String name;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TitleSubtitleText(
        title: (
          text: name,
          size: switch (context.screenSize) {
            ScreenSize.extraLarge || ScreenSize.large => 24,
            ScreenSize.normal || ScreenSize.small => 22,
          },
        ),
        subtitle: (
          text: title,
          size: switch (context.screenSize) {
            ScreenSize.extraLarge || ScreenSize.large => 16,
            ScreenSize.normal || ScreenSize.small => 14,
          },
        ),
        spacing: 4,
        textAlign: TextAlign.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}

class _SpeakerDescription extends StatelessWidget {
  const _SpeakerDescription({required this.text, this.hasSize = false});

  final String text;
  final bool hasSize;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.fclThemeScheme;

    final child = Text(text, style: theme.typography.body3Regular);

    if (!hasSize) return child;
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 200, maxHeight: 400),
      child: SingleChildScrollView(child: child),
    );
  }
}

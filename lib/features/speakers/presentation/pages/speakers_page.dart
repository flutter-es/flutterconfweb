import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_latam/features/speakers/presentation/widgets/speakers_list.dart';
import 'package:flutter_conf_latam/features/speakers/responsiveness/speakers_page_responsive.config.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpeakersPage extends ConsumerWidget {
  const SpeakersPage({super.key});

  static const String route = '/speakers';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = ref.watch(appLocalizationsProvider);
    final uiConfig =
        SpeakersPageResponsiveConfig.getSpeakersPageResponsiveConfig(context);

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: uiConfig.pagePadding,
          child: Column(
            children: [
              Column(
                children:
                    [
                          Flex(
                            direction: uiConfig.headerDirection,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                FlutterConfLatamIcons.speaker,
                                size: uiConfig.headerIconSize,
                                color: FlutterLatamColors.blueText,
                              ),
                              uiConfig.headerGap,
                              Text(
                                appLoc.speakers,
                                textAlign: TextAlign.center,
                                style: uiConfig.headerStyle,
                              ),
                            ],
                          ),
                          uiConfig.pageVerticalGap,
                          Text(
                            appLoc.speakersSubtitle,
                            textAlign: TextAlign.center,
                            style: uiConfig.subheaderStyle,
                          ),
                          uiConfig.pageVerticalGap,
                          Text(
                            appLoc.speakersPageTopParagraph,
                            textAlign: uiConfig.textAlignment,
                          ),
                          uiConfig.pageVerticalGap,
                        ]
                        .animate(interval: 100.ms)
                        .slideY(begin: 1, end: 0, curve: Curves.easeInOut)
                        .fadeIn(),
              ),
              const SpeakersList(),
              FlutterConfLatamStyles.largeVGap,
              Text(appLoc.speakersPageNote, textAlign: uiConfig.textAlignment),
              FlutterConfLatamStyles.smallVGap,
              Text(
                appLoc.speakersPageBottomParagraph,
                textAlign: uiConfig.textAlignment,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

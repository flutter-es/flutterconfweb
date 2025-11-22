import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/routes/app_route_path.dart';
import 'package:flutter_conf_latam/core/routes/helpers/navigation_view_model.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/button/fcl_button.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum CollaborationType { speaker, sponsor }

class HomeCollaborations extends ConsumerWidget {
  const HomeCollaborations({required this.type, super.key});

  final CollaborationType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final config = ref.watch(configProvider);

    final collaborations = <CollaborationItem>[
      if (type == .speaker) ...[
        CollaborationItem(
          title: l10n.homeCollaborationSpeakerTitle,
          description: l10n.homeCollaborationSpeakerDescription,
          imagePath: Assets.images.collaborations.dashSpeaker,
          button: (
            text: l10n.homeCollaborationSpeakerButton,
            function: () => _goToUrl(config.cfpFormUrl),
          ),
        ),
      ] else ...[
        CollaborationItem(
          title: l10n.homeCollaborationSponsorTitle,
          description: l10n.homeCollaborationSponsorDescription,
          imagePath: Assets.images.collaborations.dashSponsor,
          button: (
            text: l10n.homeCollaborationSponsorButton,
            function: () => ref
                .read(navigationViewModelProvider.notifier)
                .selectNavItemFromRoute('/${AppRoutePath.home.pathName}'),
          ),
        ),
      ],
    ];

    return SectionContainer(
      spacing: 0,
      children: <Widget>[
        ResponsiveGrid(
          columnSizes: switch (context.screenSize) {
            .extraLarge => 1,
            _ => 1,
          },
          rowSizes: switch (context.screenSize) {
            .extraLarge || .large => 2,
            .normal || .small => collaborations.length,
          },
          children: <Widget>[
            for (final item in collaborations)
              _CollaborationCardItem(item: item),
          ],
        ),
      ],
    );
  }

  void _goToUrl(String url) => Utils.launchUrlLink(url);
}

class _CollaborationCardItem extends StatelessWidget {
  const _CollaborationCardItem({required this.item});

  final CollaborationItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: FlutterLatamColors.blue,
      clipBehavior: .antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: .circular(20)),
      child: Padding(
        padding: const .all(48),
        child: Flex(
          spacing: switch (context.screenSize) {
            .extraLarge || .large => 50,
            _ => 24,
          },
          direction: switch (context.screenSize) {
            .extraLarge || .large => .horizontal,
            _ => .vertical,
          },
          children: <Widget>[
            Expanded(
              flex: switch (context.screenSize) {
                .extraLarge || .large => 2,
                .normal || .small => 1,
              },
              child: Column(
                spacing: 30,
                mainAxisSize: .min,
                crossAxisAlignment: .start,
                children: <Widget>[
                  TitleSubtitleText(
                    title: (
                      text: item.title,
                      size: switch (context.screenSize) {
                        .extraLarge || .large => 32,
                        .normal || .small => 24,
                      },
                    ),
                    subtitle: (
                      text: item.description,
                      size: switch (context.screenSize) {
                        .extraLarge || .large => 18,
                        .normal || .small => 16,
                      },
                    ),
                    textAlign: .start,
                    crossAxisAlignment: .start,
                    spacing: 10,
                  ),
                  FclButton.secondary(
                    label: item.button.text,
                    buttonSize: .small,
                    onPressed: item.button.function,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox.square(
                dimension: switch (context.screenSize) {
                  .extraLarge || .large => 370,
                  .normal || .small => 180,
                },
                child: SvgPicture.asset(item.imagePath),
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
    required this.button,
  });

  final String title;
  final String description;
  final String imagePath;
  final ({String text, VoidCallback function}) button;
}

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/container/error_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/shimmer_container.dart';
import 'package:flutter_conf_latam/core/widgets/images/single_image.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/features/organizers/presentation/view_model/organizers_view_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrganizersCommunities extends ConsumerWidget {
  const OrganizersCommunities({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final communities = ref.watch(communitiesProvider);

    return SectionContainer(
      spacing: 30,
      children: <Widget>[
        TitleSubtitleText(
          title: (
            text: l10n.organizersCommunityTitle,
            size: switch (context.screenSize) {
              .extraLarge => 64,
              .large => 48,
              .normal || .small => 24,
            },
          ),
          subtitle: (
            text: l10n.organizersCommunityDescription,
            size: switch (context.screenSize) {
              .extraLarge || .large => 24,
              .normal || .small => 16,
            },
          ),
          spacing: 12,
        ),
        communities.when(
          data: (data) => _CommunityListContainer(
            children: <Widget>[
              for (final item in data)
                InkWell(
                  onTap: () => Utils.launchUrlLink(item.url),
                  child: SingleImage(
                    imageUrl: item.image,
                    borderRadius: 20,
                    size: const .fromHeight(180),
                  ),
                ),
            ],
          ),
          loading: () => Shimmer(
            child: _CommunityListContainer(
              children: .generate(9, (_) {
                return const ShimmerLoading(
                  isLoading: true,
                  child: SingleImageContainer(
                    borderRadius: 20,
                    size: .fromHeight(180),
                  ),
                );
              }),
            ),
          ),
          error: (_, _) => ErrorContainer(
            onRetry: () => ref.invalidate(communitiesProvider),
          ),
        ),
      ],
    );
  }
}

class _CommunityListContainer extends StatelessWidget {
  const _CommunityListContainer({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colSize = switch (context.screenSize) {
      .extraLarge => 3,
      .large => 2,
      _ => 1,
    };

    return ResponsiveGrid(
      columnSizes: colSize,
      rowSizes: (children.length / colSize).ceil(),
      children: children,
    );
  }
}

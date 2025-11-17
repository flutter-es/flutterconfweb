import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_conf_latam/core/providers/shared_providers.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/container/error_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/keep_alive_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/pagination_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/shimmer_container.dart';
import 'package:flutter_conf_latam/core/widgets/images/character_image.dart';
import 'package:flutter_conf_latam/core/widgets/images/single_image.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/features/organizers/presentation/view_model/organizers_view_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrganizersPeople extends HookConsumerWidget {
  const OrganizersPeople({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);

    final paginationInfo = ref.watch(paginationProvider);
    final organizers = ref.watch(organizersProvider);

    useEffect(() {
      unawaited(
        Future.microtask(() {
          ref.read(paginationProvider.notifier).update((state) {
            return (page: state.page, pageSize: 16);
          });
        }),
      );
      return null;
    }, const []);

    final size = switch (context.screenSize) {
      ScreenSize.extraLarge || ScreenSize.large => const Size.square(206),
      ScreenSize.normal || ScreenSize.small => const Size.square(120),
    };

    return KeepAliveContainer(
      child: SectionContainer(
        spacing: 48,
        children: <Widget>[
          TitleSubtitleText(
            title: (
              text: l10n.organizersPeopleTitle,
              size: switch (context.screenSize) {
                ScreenSize.extraLarge => 64,
                ScreenSize.large => 48,
                ScreenSize.normal || ScreenSize.small => 24,
              },
            ),
            subtitle: (
              text: l10n.organizersPeopleDescription,
              size: switch (context.screenSize) {
                ScreenSize.extraLarge || ScreenSize.large => 24,
                ScreenSize.normal || ScreenSize.small => 16,
              },
            ),
            spacing: 12,
          ),
          organizers.when(
            data: (data) => PaginationContainer(
              totalSize: data.totalList,
              pageSize: paginationInfo.pageSize,
              currentPage: paginationInfo.page,
              onChangedPage: (value) {
                ref.read(paginationProvider.notifier).update((state) {
                  return (page: value, pageSize: state.pageSize);
                });
              },
              child: _OrganizerListContainer(
                children: <Widget>[
                  for (final item in data.galleryList)
                    Center(
                      child: Column(
                        spacing: 20,
                        children: <Widget>[
                          CharacterImage(
                            imageUrl: item.imageUrl,
                            flagImageUrl: item.countryFlag,
                            size: size,
                          ),
                          TitleSubtitleText(
                            title: (
                              text: item.name,
                              size: switch (context.screenSize) {
                                ScreenSize.extraLarge || ScreenSize.large => 24,
                                ScreenSize.normal || ScreenSize.small => 12,
                              },
                            ),
                            subtitle: (
                              text: item.levels.join(' - '),
                              size: switch (context.screenSize) {
                                ScreenSize.extraLarge || ScreenSize.large => 16,
                                ScreenSize.normal || ScreenSize.small => 12,
                              },
                            ),
                            spacing: 4,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            loading: () => Shimmer(
              child: _OrganizerListContainer(
                children: List.generate(9, (_) {
                  return Center(
                    child: ShimmerLoading(
                      isLoading: true,
                      child: Column(
                        spacing: 20,
                        children: <Widget>[
                          SingleImageContainer(size: size, borderRadius: 30),
                          const TitleSubtitleTextContainer(),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            error: (_, _) => ErrorContainer(
              onRetry: () => ref.invalidate(organizersProvider),
            ),
          ),
        ],
      ),
    );
  }
}

class _OrganizerListContainer extends StatelessWidget {
  const _OrganizerListContainer({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colSize = switch (context.screenSize) {
      ScreenSize.extraLarge => 4,
      _ => 2,
    };

    return ResponsiveGrid(
      columnSizes: colSize,
      rowSizes: (children.length / colSize).ceil(),
      children: children,
    );
  }
}

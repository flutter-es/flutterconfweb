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
import 'package:signals/signals_flutter.dart';

class OrganizersPeople extends SignalStatefulWidget {
  const OrganizersPeople({super.key});

  @override
  State<OrganizersPeople> createState() => _OrganizersPeopleState();
}

class _OrganizersPeopleState extends State<OrganizersPeople> {
  @override
  void initState() {
    super.initState();
    paginationController.update(pageSize: 16);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = appLocalizations.value;

    final size = switch (context.screenSize) {
      .extraLarge || .large => const Size.square(206),
      .normal || .small => const Size.square(120),
    };

    final organizers = organizersSignal.value;
    return KeepAliveContainer(
      child: SectionContainer(
        spacing: 48,
        children: <Widget>[
          TitleSubtitleText(
            title: (
              text: l10n.organizersPeopleTitle,
              size: switch (context.screenSize) {
                .extraLarge => 64,
                .large => 48,
                .normal || .small => 24,
              },
            ),
            subtitle: (
              text: l10n.organizersPeopleDescription,
              size: switch (context.screenSize) {
                .extraLarge || .large => 24,
                .normal || .small => 16,
              },
            ),
            spacing: 12,
          ),
          organizers.map(
            data: (data) => PaginationContainer(
              totalSize: data.totalList,
              pageSize: paginationController.value.pageSize,
              currentPage: paginationController.value.page,
              onChangedPage: (value) {
                paginationController.update(page: value);
              },
              child: _OrganizerListContainer(
                children: <Widget>[
                  for (final item in data.organizerList)
                    Center(
                      child: Column(
                        spacing: 20,
                        children: <Widget>[
                          CharacterImage(
                            imageUrl: item.user.avatarUrl ?? '',
                            flagImageUrl: item.user.countryFlag ?? '',
                            size: size,
                          ),
                          TitleSubtitleText(
                            title: (
                              text: item.user.name,
                              size: switch (context.screenSize) {
                                .extraLarge || .large => 24,
                                .normal || .small => 12,
                              },
                            ),
                            subtitle: (
                              text: item.areas.map((a) => a.name).join(' - '),
                              size: switch (context.screenSize) {
                                .extraLarge || .large => 16,
                                .normal || .small => 12,
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
                children: .generate(9, (_) {
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
            error: (_, _) => const ErrorContainer(onRetry: reloadOrganizers),
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

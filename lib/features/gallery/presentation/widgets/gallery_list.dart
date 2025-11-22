import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/providers/shared_providers.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/container/error_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/pagination_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/shimmer_container.dart';
import 'package:flutter_conf_latam/core/widgets/images/single_image.dart';
import 'package:flutter_conf_latam/features/gallery/presentation/view_model/gallery_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GalleryList extends ConsumerWidget {
  const GalleryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paginationInfo = ref.watch(paginationProvider);
    final galleryList = ref.watch(galleryProvider);

    final size = switch (context.screenSize) {
      .extraLarge => const Size.square(378),
      _ => const Size.square(264),
    };

    return galleryList.when(
      data: (data) => PaginationContainer(
        totalSize: data.totalList,
        pageSize: paginationInfo.pageSize,
        currentPage: paginationInfo.page,
        onChangedPage: (value) {
          ref.read(paginationProvider.notifier).update(page: value);
        },
        child: _GalleryListContainer(
          children: <Widget>[
            for (final item in data.galleryList)
              Center(
                child: SingleImage(
                  imageUrl: item.imageUrl,
                  size: size,
                  borderRadius: 12,
                ),
              ),
          ],
        ),
      ),
      loading: () => Shimmer(
        child: _GalleryListContainer(
          children: .generate(9, (_) {
            return Center(
              child: ShimmerLoading(
                isLoading: true,
                child: SingleImageContainer(size: size, borderRadius: 12),
              ),
            );
          }),
        ),
      ),
      error: (_, _) {
        return ErrorContainer(onRetry: () => ref.invalidate(galleryProvider));
      },
    );
  }
}

class _GalleryListContainer extends StatelessWidget {
  const _GalleryListContainer({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colSize = switch (context.screenSize) {
      .extraLarge => 3,
      .large => 2,
      _ => 1,
    };

    return Padding(
      padding: .symmetric(
        horizontal: switch (context.screenSize) {
          .extraLarge => 122,
          .large => 72,
          .normal || .small => 28,
        },
      ),
      child: ResponsiveGrid(
        columnSizes: colSize,
        rowSizes: (children.length / colSize).ceil(),
        children: children,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/container/error_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/pagination_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/images/single_image.dart';
import 'package:flutter_conf_latam/features/gallery/presentation/view_model/gallery_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GalleryList extends ConsumerWidget {
  const GalleryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paginationInfo = ref.watch(paginationProvider);
    final galleryList = ref.watch(galleryProvider);

    return galleryList.maybeWhen(
      data: (data) {
        return PaginationContainer(
          totalSize: data.totalList,
          pageSize: paginationInfo.pageSize,
          currentPage: paginationInfo.page,
          onChangedPage: (value) {
            ref.read(paginationProvider.notifier).update((state) {
              return (page: value, pageSize: state.pageSize);
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: switch (context.screenSize) {
                ScreenSize.extraLarge => 122,
                ScreenSize.large => 72,
                ScreenSize.normal || ScreenSize.small => 28,
              },
            ),
            child: ResponsiveGrid(
              columnSizes: switch (context.screenSize) {
                ScreenSize.extraLarge => 3,
                ScreenSize.large => 2,
                _ => 1,
              },
              rowSizes: data.galleryList.length,
              children: <Widget>[
                for (final item in data.galleryList)
                  Center(child: SingleImage(imageUrl: item.imageUrl)),
              ],
            ),
          ),
        );
      },
      error: (_, _) {
        return ErrorContainer(onRetry: () => ref.invalidate(galleryProvider));
      },
      orElse: Offstage.new,
    );
  }
}

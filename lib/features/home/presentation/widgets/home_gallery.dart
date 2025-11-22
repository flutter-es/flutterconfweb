import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/container/carousel_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/container/shimmer_container.dart';
import 'package:flutter_conf_latam/core/widgets/images/single_image.dart';
import 'package:flutter_conf_latam/features/home/presentation/view_model/home_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeGallery extends ConsumerWidget {
  const HomeGallery({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gallery = ref.watch(galleryPreviewProvider);

    final size = switch (context.screenSize) {
      .extraLarge => const Size.square(360),
      _ => const Size.square(264),
    };

    return SectionContainer(
      spacing: 0,
      children: <Widget>[
        gallery.maybeWhen(
          data: (data) {
            if (data.isEmpty) return const Offstage();
            return CarouselContainer(
              itemSize: size,
              items: <Widget>[
                for (final item in data)
                  Center(
                    child: SingleImage(imageUrl: item, size: size),
                  ),
              ],
            );
          },
          loading: () => Shimmer(
            child: CarouselContainer(
              itemSize: size,
              items: .generate(20, (_) {
                return Center(
                  child: ShimmerLoading(
                    isLoading: true,
                    child: SingleImageContainer(size: size),
                  ),
                );
              }),
            ),
          ),
          orElse: Offstage.new,
        ),
      ],
    );
  }
}

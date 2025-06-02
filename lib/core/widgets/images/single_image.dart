import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/styles/colors.dart';

class SingleImage extends StatelessWidget {
  const SingleImage({required this.imageUrl, super.key});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (_, imageProvider) => SingleImageContainer(
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
      progressIndicatorBuilder: (_, _, _) => const SingleImageContainer(),
      errorWidget: (_, _, _) {
        return const Center(child: Text('Error al cargar la imagen'));
      },
    );
  }
}

class SingleImageContainer extends StatelessWidget {
  const SingleImageContainer({super.key, this.image});

  final DecorationImage? image;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: switch (context.screenSize) {
        ScreenSize.extraLarge => 378,
        _ => 264,
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: image == null ? FlutterLatamColors.darkBlue : null,
          borderRadius: BorderRadius.circular(12),
          image: image,
        ),
        child: image == null ? const SizedBox() : null,
      ),
    );
  }
}

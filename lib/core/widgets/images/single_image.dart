import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/styles/colors.dart';

class SingleImage extends StatelessWidget {
  const SingleImage({required this.imageUrl, required this.size, super.key});

  final String imageUrl;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (_, imageProvider) => SingleImageContainer(
        size: size,
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
      progressIndicatorBuilder: (_, _, _) => SingleImageContainer(size: size),
      errorWidget: (_, _, _) {
        return const Center(child: Text('Error al cargar la imagen'));
      },
    );
  }
}

class SingleImageContainer extends StatelessWidget {
  const SingleImageContainer({required this.size, this.image, super.key});

  final DecorationImage? image;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
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

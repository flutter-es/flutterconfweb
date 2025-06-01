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
      imageBuilder: (_, imageProvider) => SizedBox.square(
        dimension: switch (context.screenSize) {
          ScreenSize.extraLarge => 378,
          _ => 264,
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
      ),
      progressIndicatorBuilder: (_, _, progress) {
        return Center(
          child: CircularProgressIndicator(
            color: FlutterLatamColors.white,
            value: progress.progress,
          ),
        );
      },
    );
  }
}

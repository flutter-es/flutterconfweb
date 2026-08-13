import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/widgets/images/single_image.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';

class CharacterImage extends StatelessWidget {
  const CharacterImage({
    required this.imageUrl,
    required this.flagImageUrl,
    required this.size,
    super.key,
  });

  final String imageUrl;
  final String flagImageUrl;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: LayoutBuilder(
        builder: (_, constraints) {
          final flagSize = constraints.maxWidth * .20;
          final flagPadding = constraints.maxWidth * .07;

          return Stack(
            children: <Widget>[
              Positioned.fill(
                child: SingleImage(
                  imageUrl: imageUrl,
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  borderRadius: 30,
                ),
              ),
              if (flagImageUrl.isNotEmpty)
                Positioned(
                  top: flagPadding,
                  left: flagPadding,
                  child: SizedBox.square(
                    dimension: flagSize,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        shape: .circle,
                        color: FlutterLatamColors.white,
                      ),
                      child: Center(
                        child: Text(
                          flagImageUrl,
                          style: TextStyle(fontSize: flagSize * .6),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AdaptableText extends StatelessWidget {
  const AdaptableText(
    this.text, {
    required this.style,
    this.textAlign = TextAlign.left,
    this.textDirection = TextDirection.ltr,
    this.minimumFontScale = .5,
    this.textOverflow = TextOverflow.ellipsis,
    super.key,
  });

  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final double minimumFontScale;
  final TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textAlign: textAlign,
      maxLines: 100,
      textDirection: textDirection,
    );

    return LayoutBuilder(
      builder: (_, constraints) {
        painter.layout(maxWidth: constraints.maxWidth);
        var textScaleFactor = 1.0;

        if (painter.height > constraints.maxHeight) {
          painter
            ..textScaler = TextScaler.linear(minimumFontScale)
            ..layout(maxWidth: constraints.maxWidth);

          if (painter.height > constraints.maxHeight) {
            textScaleFactor = minimumFontScale;
          } else if (minimumFontScale < 1) {
            var h = 100;
            var l = (minimumFontScale * 100).toInt();

            while (h > l) {
              final mid = (l + (h - l) / 2).toInt();
              final newScale = mid.toDouble() / 100.0;

              painter
                ..textScaler = TextScaler.linear(newScale)
                ..layout(maxWidth: constraints.maxWidth);

              if (painter.height > constraints.maxHeight) {
                h = mid - 1;
              } else {
                l = mid + 1;
              }

              if (h <= l) {
                textScaleFactor = newScale - .01;
                painter
                  ..textScaler = TextScaler.linear(newScale)
                  ..layout(maxWidth: constraints.maxWidth);

                break;
              }
            }
          }
        }

        return Text(
          text,
          style: style,
          maxLines: 100,
          textAlign: textAlign,
          overflow: textOverflow,
          textDirection: textDirection,
          textScaler: TextScaler.linear(textScaleFactor),
        );
      },
    );
  }
}

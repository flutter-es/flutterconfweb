import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/styles/colors.dart';

typedef TextWithSize = ({String text, double size});

class TitleSubtitleText extends StatelessWidget {
  const TitleSubtitleText({
    required this.title,
    required this.subtitle,
    this.spacing = 0,
    super.key,
  });

  final TextWithSize title;
  final TextWithSize subtitle;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: spacing,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          title.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Recoleta',
            fontSize: title.size,
            fontWeight: FontWeight.bold,
            color: FlutterLatamColors.white,
          ),
        ),
        Text(
          subtitle.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: subtitle.size,
            fontWeight: FontWeight.w400,
            color: FlutterLatamColors.white,
          ),
        ),
      ],
    );
  }
}

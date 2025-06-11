import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/styles/colors.dart';

typedef TextWithSize = ({String text, double size});

class TitleSubtitleText extends StatelessWidget {
  const TitleSubtitleText({
    required this.title,
    required this.subtitle,
    this.textAlign = TextAlign.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.spacing = 0,
    super.key,
  });

  final TextWithSize title;
  final TextWithSize subtitle;
  final TextAlign textAlign;
  final CrossAxisAlignment crossAxisAlignment;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: spacing,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        Text(
          title.text,
          textAlign: textAlign,
          style: TextStyle(
            fontFamily: 'Recoleta',
            fontSize: title.size,
            fontWeight: FontWeight.bold,
            color: FlutterLatamColors.white,
          ),
        ),
        Text(
          subtitle.text,
          textAlign: textAlign,
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

class TitleSubtitleTextContainer extends StatelessWidget {
  const TitleSubtitleTextContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: FlutterLatamColors.darkBlue,
      borderRadius: BorderRadius.circular(16),
    );

    return Column(
      spacing: 16,
      children: <Widget>[
        Container(width: 200, height: 24, decoration: decoration),
        Container(width: 100, height: 24, decoration: decoration),
      ],
    );
  }
}

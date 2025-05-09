import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/styles/colors.dart';

class GridCardItem extends StatelessWidget {
  const GridCardItem({
    required this.title,
    required this.description,
    this.imagePath,
    super.key,
  });

  final String title;
  final String description;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF2E5288),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Recoleta',
                      fontSize: switch (context.screenSize) {
                        ScreenSize.extraLarge => 32,
                        _ => 24,
                      },
                      fontWeight: FontWeight.bold,
                      color: FlutterLatamColors.white,
                    ),
                  ),
                ),
                if (imagePath != null)
                  SizedBox.square(
                    dimension: 80,
                    child: Image.asset(imagePath!),
                  ),
              ],
            ),
            Text(
              description,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: FlutterLatamColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

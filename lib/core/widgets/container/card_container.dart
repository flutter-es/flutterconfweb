import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    required this.borderColor,
    required this.child,
    super.key,
  });

  final Color borderColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: FlutterLatamColors.darkBlue,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 10,
              decoration: BoxDecoration(color: borderColor),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: switch (context.screenSize) {
                    ScreenSize.extraLarge => 64,
                    ScreenSize.large => 48,
                    ScreenSize.normal || ScreenSize.small => 24,
                  },
                  vertical: 32,
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

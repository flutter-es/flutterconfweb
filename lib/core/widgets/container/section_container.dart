import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({required this.children, this.spacing, super.key});

  final List<Widget> children;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    final defaultSpacing = switch (context.screenSize) {
      ScreenSize.extraLarge || ScreenSize.large => 96.0,
      ScreenSize.normal || ScreenSize.small => 48.0,
    };

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: switch (context.screenSize) {
          ScreenSize.extraLarge => 122,
          ScreenSize.large => 72,
          ScreenSize.normal || ScreenSize.small => 28,
        },
        vertical: switch (context.screenSize) {
          ScreenSize.extraLarge || ScreenSize.large => 96,
          ScreenSize.normal || ScreenSize.small => 48,
        },
      ),
      child: Column(
        spacing: spacing ?? defaultSpacing,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}

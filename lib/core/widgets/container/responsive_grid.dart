import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      rowGap: 30,
      columnGap: 30,
      autoPlacement: AutoPlacement.rowDense,
      columnSizes: switch (context.screenSize) {
        ScreenSize.extraLarge || ScreenSize.large => [1.fr, 1.fr],
        ScreenSize.normal || ScreenSize.small => [1.fr],
      },
      rowSizes: switch (context.screenSize) {
        ScreenSize.extraLarge || ScreenSize.large => [auto, auto],
        ScreenSize.normal ||
        ScreenSize.small => List.generate(children.length, (_) => auto),
      },
      children: children,
    );
  }
}

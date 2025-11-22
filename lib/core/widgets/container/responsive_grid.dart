import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    required this.children,
    required this.columnSizes,
    required this.rowSizes,
    super.key,
  });

  final List<Widget> children;
  final int columnSizes;
  final int rowSizes;

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      rowGap: 30,
      columnGap: 30,
      columnSizes: .generate(columnSizes, (_) => 1.fr),
      rowSizes: .generate(rowSizes, (_) => auto),
      children: children,
    );
  }
}

import 'package:flutter/material.dart';

class VerticalLinePainter extends CustomPainter {
  const VerticalLinePainter({required this.getX, required this.color});

  final double Function(double width) getX;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(getX(size.width), 0),
      Offset(getX(size.width), size.height),
      Paint()
        ..color = color
        ..strokeWidth = 2,
    );
  }

  @override
  bool shouldRepaint(VerticalLinePainter old) => old.color != color;
}

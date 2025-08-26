import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/theme.dart';

class MarqueeTextAnimation extends StatefulWidget {
  const MarqueeTextAnimation({required this.text, this.speed = 80, super.key});

  final String text;
  final double speed;

  @override
  State<MarqueeTextAnimation> createState() => _MarqueeTextAnimationState();
}

class _MarqueeTextAnimationState extends State<MarqueeTextAnimation>
    with SingleTickerProviderStateMixin {
  late double _textWidth;
  late double _screenWidth;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateDimensions();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!mounted) return const Offstage();
    return ClipRect(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, child) {
          final totalWidth = _textWidth + _screenWidth;
          return Transform.translate(
            offset: Offset(-_animationController.value * totalWidth, 0),
            child: child,
          );
        },
        child: Row(
          spacing: _screenWidth,
          children: <Widget>[
            Text(widget.text, style: _currentStyle),
            Text(widget.text, style: _currentStyle),
          ],
        ),
      ),
    );
  }

  TextStyle get _currentStyle {
    final theme = context.theme.fclThemeScheme;
    final textStyle = switch (context.screenSize) {
      ScreenSize.extraLarge => theme.typography.body1Regular,
      ScreenSize.large => theme.typography.body2Regular,
      _ => theme.typography.body3Regular,
    };
    return textStyle.copyWith(color: FlutterLatamColors.black);
  }

  void _calculateDimensions() {
    final textSpan = TextSpan(text: widget.text, style: _currentStyle);
    final textPainter = TextPainter(
      text: textSpan,
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    _textWidth = textPainter.size.width;
    _screenWidth = MediaQuery.sizeOf(context).width;

    final totalWidth = _textWidth + _screenWidth;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: (totalWidth / widget.speed * 1000).toInt(),
      ),
    )..repeat();

    setState(() {});
  }
}

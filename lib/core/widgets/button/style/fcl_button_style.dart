part of '../fcl_button.dart';

class _FclButtonStyle extends ButtonStyle {
  const _FclButtonStyle();

  @override
  AlignmentGeometry? get alignment => Alignment.center;

  @override
  Duration? get animationDuration => const Duration(milliseconds: 200);

  @override
  InteractiveInkFeatureFactory? get splashFactory => InkRipple.splashFactory;

  @override
  MaterialTapTargetSize? get tapTargetSize => MaterialTapTargetSize.shrinkWrap;

  @override
  WidgetStateProperty<EdgeInsetsGeometry?>? get padding {
    return const WidgetStatePropertyAll(EdgeInsets.all(20));
  }

  @override
  WidgetStateProperty<Size?>? get maximumSize {
    return const WidgetStatePropertyAll(Size.fromHeight(56));
  }

  @override
  WidgetStateProperty<Size?>? get fixedSize {
    return const WidgetStatePropertyAll(Size.fromHeight(44));
  }

  @override
  VisualDensity? get visualDensity => VisualDensity.adaptivePlatformDensity;

  @override
  WidgetStateProperty<double?>? get elevation {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) return 0;
      return 2;
    });
  }

  @override
  WidgetStateProperty<Color?>? get iconColor {
    return const WidgetStatePropertyAll(FlutterLatamColors.white);
  }

  @override
  WidgetStateProperty<double>? get iconSize {
    return const WidgetStatePropertyAll(24);
  }

  @override
  WidgetStateProperty<Color?>? get foregroundColor {
    return const WidgetStatePropertyAll(FlutterLatamColors.white);
  }

  @override
  WidgetStateProperty<TextStyle?>? get textStyle {
    return const WidgetStatePropertyAll(
      TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        height: 1.2,
        fontWeight: FontWeight.w500,
        color: FlutterLatamColors.white,
      ),
    );
  }

  @override
  WidgetStateProperty<Color?>? get overlayColor {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return FlutterLatamColors.white.withValues(alpha: .3);
      }
      return null;
    });
  }
}

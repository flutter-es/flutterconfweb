part of '../fcl_button.dart';

class _FclButtonStyle extends ButtonStyle {
  const _FclButtonStyle({required this.buttonSize});

  final ButtonSize buttonSize;

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
    return WidgetStatePropertyAll(switch (buttonSize) {
      ButtonSize.small => const EdgeInsets.symmetric(horizontal: 20),
      ButtonSize.large => const EdgeInsets.symmetric(horizontal: 40),
    });
  }

  @override
  WidgetStateProperty<Size?>? get maximumSize {
    return const WidgetStatePropertyAll(Size.fromHeight(68));
  }

  @override
  WidgetStateProperty<Size?>? get fixedSize {
    return WidgetStatePropertyAll(switch (buttonSize) {
      ButtonSize.small => const Size.fromHeight(44),
      ButtonSize.large => const Size.fromHeight(68),
    });
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
    return WidgetStatePropertyAll(switch (buttonSize) {
      ButtonSize.small => 20,
      ButtonSize.large => 24,
    });
  }

  @override
  WidgetStateProperty<Color?>? get foregroundColor {
    return const WidgetStatePropertyAll(FlutterLatamColors.white);
  }

  @override
  WidgetStateProperty<TextStyle?>? get textStyle {
    return WidgetStatePropertyAll(
      TextStyle(
        fontFamily: 'Poppins',
        fontSize: switch (buttonSize) {
          ButtonSize.small => 16,
          ButtonSize.large => 20,
        },
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

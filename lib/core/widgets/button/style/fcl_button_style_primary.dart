part of '../fcl_button.dart';

class _FclButtonStylePrimary extends _FclButtonStyle {
  const _FclButtonStylePrimary({required super.buttonSize});

  @override
  WidgetStateProperty<Color?>? get backgroundColor {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return FlutterLatamColors.blue.withValues(alpha: .3);
      }
      return FlutterLatamColors.blue;
    });
  }

  @override
  ButtonLayerBuilder? get backgroundBuilder {
    return (BuildContext context, Set<WidgetState> state, Widget? child) {
      if (child == null) return const Offstage();
      return child;
    };
  }

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape {
    return const WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(80)),
      ),
    );
  }
}

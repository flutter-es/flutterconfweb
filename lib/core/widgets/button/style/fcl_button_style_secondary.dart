part of '../fcl_button.dart';

class _FclButtonStyleSecondary extends _FclButtonStyle {
  const _FclButtonStyleSecondary();

  @override
  WidgetStateProperty<Color?>? get backgroundColor {
    return WidgetStateProperty.all(Colors.transparent);
  }

  @override
  WidgetStateProperty<Color?>? get shadowColor {
    return WidgetStateProperty.all(Colors.transparent);
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
        side: BorderSide(color: FlutterLatamColors.white, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(80)),
      ),
    );
  }
}

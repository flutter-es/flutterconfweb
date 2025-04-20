import 'package:flutter/material.dart';

class ScreenPage<T> extends Page<T> {
  const ScreenPage({required super.key, required this.child});

  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) {
    return MaterialPageRoute<T>(settings: this, builder: (_) => child);
  }
}

class ModalBottomPage<T> extends Page<T> {
  const ModalBottomPage({
    required super.key,
    required this.child,
    this.showDragHandle = true,
    this.isScrollControlled = false,
    this.initialChildSize = .5,
    this.heightFactor,
    super.name,
    super.arguments,
    super.restorationId,
  });

  final Widget child;
  final bool showDragHandle;
  final bool isScrollControlled;
  final double initialChildSize;
  final double? heightFactor;

  @override
  Route<T> createRoute(BuildContext context) {
    return ModalBottomSheetRoute<T>(
      settings: this,
      useSafeArea: true,
      clipBehavior: Clip.hardEdge,
      showDragHandle: showDragHandle,
      backgroundColor: Colors.transparent,
      isScrollControlled: isScrollControlled,
      modalBarrierColor: Colors.black.withValues(alpha: .25),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        if (heightFactor == null) {
          if (isScrollControlled) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: initialChildSize,
              builder: (_, controller) {
                return SingleChildScrollView(
                  controller: controller,
                  child: child,
                );
              },
            );
          }
          return child;
        }
        return FractionallySizedBox(heightFactor: heightFactor, child: child);
      },
    );
  }
}

class DialogPage<T> extends Page<T> {
  const DialogPage({
    required super.key,
    required this.child,
    this.heightFactor = .8,
    super.name,
    super.arguments,
    super.restorationId,
  });

  final Widget child;
  final double heightFactor;

  @override
  Route<T> createRoute(BuildContext context) {
    return DialogRoute<T>(
      context: context,
      builder: (_) {
        return FractionallySizedBox(
          widthFactor: 0.7,
          heightFactor: heightFactor,
          child: child,
        );
      },
    );
  }
}

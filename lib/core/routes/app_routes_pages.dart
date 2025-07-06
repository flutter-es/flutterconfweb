import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/styles/colors.dart';

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
    this.isDismissible = true,
    this.showDragHandle = true,
    this.isScrollControlled = false,
    this.initialChildSize = .5,
    this.heightFactor,
    super.name,
    super.arguments,
    super.restorationId,
  });

  final Widget child;
  final bool isDismissible;
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
      isDismissible: isDismissible,
      showDragHandle: showDragHandle,
      backgroundColor: Colors.transparent,
      isScrollControlled: isScrollControlled,
      modalBarrierColor: FlutterLatamColors.black.withValues(alpha: .25),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        final Widget newChild;

        if (heightFactor == null) {
          if (isScrollControlled) {
            newChild = DraggableScrollableSheet(
              expand: false,
              initialChildSize: initialChildSize,
              builder: (_, controller) {
                return SingleChildScrollView(
                  controller: controller,
                  child: child,
                );
              },
            );
          } else {
            newChild = child;
          }
        } else {
          newChild = FractionallySizedBox(
            heightFactor: heightFactor,
            child: child,
          );
        }

        return Container(
          margin: const EdgeInsets.only(top: 64),
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          decoration: const BoxDecoration(
            color: FlutterLatamColors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),
          child: newChild,
        );
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
          child: Container(
            margin: const EdgeInsets.all(32),
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: FlutterLatamColors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: child,
          ),
        );
      },
    );
  }
}

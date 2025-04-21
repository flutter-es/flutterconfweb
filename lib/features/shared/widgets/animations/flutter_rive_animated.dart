import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/enums/enums.dart';
import 'package:rive/rive.dart' as rive;

class FlutterRiveAnimated extends StatefulWidget {
  const FlutterRiveAnimated({
    required this.path,
    required this.animation,
    super.key,
  });

  final String path;
  final FlutterConfAnimations animation;

  @override
  State<FlutterRiveAnimated> createState() => _FlutterRiveAnimatedState();
}

class _FlutterRiveAnimatedState extends State<FlutterRiveAnimated> {
  late rive.StateMachineController? stateMachineController;
  late rive.RiveAnimation animation;

  @override
  void initState() {
    super.initState();

    animation = rive.RiveAnimation.asset(
      widget.path,
      artboard: widget.animation.name,
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  void onRiveInit(rive.Artboard artboard) {
    stateMachineController = rive.StateMachineController.fromArtboard(
      artboard,
      widget.animation.name,
    );

    if (stateMachineController != null) {
      artboard.addController(stateMachineController!);
    }
  }

  @override
  void dispose() {
    stateMachineController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: animation,
        );
      },
    );
  }
}

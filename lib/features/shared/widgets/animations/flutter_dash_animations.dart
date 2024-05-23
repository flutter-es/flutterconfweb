import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:rive/rive.dart' as rive;

class FlutterDashAnimation extends StatefulWidget {
  const FlutterDashAnimation({
    super.key,
    this.animation = FlutterDashAnimations.flutterdashwave,
  });

  final FlutterDashAnimations animation;

  @override
  State<FlutterDashAnimation> createState() => _FlutterDashAnimationState();
}

class _FlutterDashAnimationState extends State<FlutterDashAnimation> {
  late rive.StateMachineController smController;
  late rive.RiveAnimation animation;

  @override
  void initState() {
    super.initState();

    animation = rive.RiveAnimation.asset(
      './assets/anims/flutterdash.riv',
      artboard: widget.animation.name,
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  void onRiveInit(rive.Artboard artboard) {
    smController = rive.StateMachineController.fromArtboard(
      artboard,
      widget.animation.name,
    )!;
    artboard.addController(smController);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: animation,
        );
      },
    );
  }
}

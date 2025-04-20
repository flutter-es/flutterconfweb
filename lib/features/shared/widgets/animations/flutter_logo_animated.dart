import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/helpers/enums.dart';
import 'package:rive/rive.dart' as rive;

class FlutterLogoAnimated extends StatefulWidget {
  const FlutterLogoAnimated({
    super.key,
    this.animation = FlutterLogoAnimations.flutterconflogo,
  });

  final FlutterLogoAnimations animation;

  @override
  State<FlutterLogoAnimated> createState() => _FlutterLogoAnimatedState();
}

class _FlutterLogoAnimatedState extends State<FlutterLogoAnimated> {
  late rive.StateMachineController? smController;
  late rive.RiveAnimation animation;

  @override
  void initState() {
    super.initState();

    animation = rive.RiveAnimation.asset(
      './assets/anims/flutterconflogo.riv',
      artboard: widget.animation.name,
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  void onRiveInit(rive.Artboard artboard) {
    smController = rive.StateMachineController.fromArtboard(
      artboard,
      widget.animation.name,
    );
    if (smController != null) artboard.addController(smController!);
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

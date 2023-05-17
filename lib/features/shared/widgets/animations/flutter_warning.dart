import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:rive/rive.dart' as rive;

class FlutterWarningAnimated extends StatefulWidget {

  const FlutterWarningAnimated({
    super.key,
    this.animation = FlutterWarningAnimations.flutterwarning,
  });

  final FlutterWarningAnimations animation;

  @override
  State<FlutterWarningAnimated> createState() => _FlutterWarningAnimatedState();
}

class _FlutterWarningAnimatedState extends State<FlutterWarningAnimated> {

  late rive.StateMachineController smController;
  late rive.RiveAnimation animation;

  @override
  void initState() {
    super.initState();

    animation = rive.RiveAnimation.asset(
      './assets/anims/flutter_warning.riv',
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

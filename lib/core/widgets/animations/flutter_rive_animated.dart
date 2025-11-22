import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/enums/enums.dart';
import 'package:rive/rive.dart';

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
  late StateMachineController? _stateMachineController;
  late RiveAnimation _animation;

  @override
  void initState() {
    super.initState();

    _animation = .asset(
      widget.path,
      artboard: widget.animation.name,
      fit: .contain,
      onInit: _onRiveInit,
    );
  }

  @override
  void dispose() {
    _stateMachineController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => SizedBox.fromSize(
        size: Size(constraints.maxWidth, constraints.maxHeight),
        child: _animation,
      ),
    );
  }

  void _onRiveInit(Artboard artboard) {
    _stateMachineController = StateMachineController.fromArtboard(
      artboard,
      widget.animation.name,
    );

    if (_stateMachineController != null) {
      artboard.addController(_stateMachineController!);
    }
  }
}

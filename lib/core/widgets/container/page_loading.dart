import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/animations/flutter_rive_animated.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';

class PageLoading extends StatelessWidget {
  const PageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: switch (context.screenSize) {
          .extraLarge => 400,
          .large => 350,
          .normal => 300,
          .small => 250,
        },
        child: FlutterRiveAnimated(
          path: Assets.animations.flutterdash,
          animation: .flutterDashWave,
        ),
      ),
    );
  }
}

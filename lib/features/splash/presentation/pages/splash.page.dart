import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_latam/core/enums/enums.dart';
import 'package:flutter_conf_latam/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_latam/features/shared/widgets/animations/flutter_rive_animated.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const String route = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer timer = Timer(Duration.zero, () {});

  @override
  void initState() {
    super.initState();

    timer = Timer(2.seconds, () {
      Router.neglect(context, () => GoRouter.of(context).go(HomePage.route));
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox.square(
          dimension: 200,
          child: FlutterRiveAnimated(
            path: './assets/anims/flutterconflogo.riv',
            animation: FlutterConfAnimations.flutterLogo,
          ),
        ),
      ),
    );
  }
}

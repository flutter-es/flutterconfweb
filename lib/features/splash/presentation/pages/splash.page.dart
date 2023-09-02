import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/animations/flutter_logo_animated.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {

  static const String route = '/';

  const SplashPage({super.key});

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
        child: SizedBox(
          width: 200, height: 200,
          child: FlutterLogoAnimated(
            animation: FlutterLogoAnimations.flutterlogo,
          ),
        ),
      ),
    );
  }
}

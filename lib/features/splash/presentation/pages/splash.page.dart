import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {

  static const String route = '/splash';
  
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(2.seconds, () {
      GoRouter.of(context).go('/home');
    });

    return Scaffold(
      body: Center(
        child: Text('splash'),
      ),
    );
  }
}
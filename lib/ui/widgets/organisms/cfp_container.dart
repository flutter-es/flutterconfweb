import 'package:flutter/material.dart';

class CfpContainer extends StatelessWidget {
  const CfpContainer({super.key});

  static const height = 600.0;

  static const title = 'cfp_container';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.amber[400],
      alignment: Alignment.center,
      child: const Text(title),
    );
  }
}

import 'package:flutter/material.dart';

class SponsorsContainer extends StatelessWidget {
  const SponsorsContainer({super.key});

  static const height = 600.0;
  static const title = 'sponsors_container';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.pink[400],
      alignment: Alignment.center,
      child: Text(
        title
      ),
    );
  }
}

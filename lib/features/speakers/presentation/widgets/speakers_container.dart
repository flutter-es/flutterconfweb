import 'package:flutter/material.dart';

class SpeakersContainer extends StatelessWidget {
  const SpeakersContainer({super.key});

  static const height = 600.0;

  static const title = 'speakers_container';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.blue[400],
      alignment: Alignment.center,
      child: Text(
        title
      ),
    );
  }
}

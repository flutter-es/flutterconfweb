import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/ui/internations/translation.dart';

class TicketsContainer extends StatelessWidget {
  const TicketsContainer({super.key});

  static const height = 600.0;

  static const title = 'tickets_container';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.purple[400],
      alignment: Alignment.center,
      child: Text(
        Translation.of(context, title),
      ),
    );
  }
}

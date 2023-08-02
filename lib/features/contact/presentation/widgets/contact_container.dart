import 'package:flutter/material.dart';

class ContactContainer extends StatelessWidget {
  const ContactContainer({super.key});

  static const height = 600.0;

  static const title = 'contact_container';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.red[400],
      alignment: Alignment.center,
      child: Text(
        title,
      ),
    );
  }
}

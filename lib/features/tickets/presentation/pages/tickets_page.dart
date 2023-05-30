import 'package:flutter/material.dart';

class TicketsPage extends StatelessWidget {

  static const String route = '/tickets';

  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tickets'),
    );
  }
}
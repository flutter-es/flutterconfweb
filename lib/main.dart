import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/ui/pages/home_page.dart';

void main() {
  runApp(const FlutterCon());
}

class FlutterCon extends StatelessWidget {
  const FlutterCon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Con',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins'
      ),
      home: HomePage(),
    );
  }
}

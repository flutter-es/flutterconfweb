import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/ui/pages/home_page.dart';
import 'package:flutter_conf_colombia/ui/internations/translation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const FlutterCon());
}

class FlutterCon extends StatefulWidget {
  const FlutterCon({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    final state = context.findAncestorStateOfType<_FlutterConState>()!;
    state.changeLanguage(newLocale);
  }

  @override
  State<FlutterCon> createState() => _FlutterConState();
}

class _FlutterConState extends State<FlutterCon> {
  Locale _locale = Translation.es;

  void changeLanguage(Locale newLocal) {
    setState(() {
      _locale = newLocal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Con',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: _locale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Translation.en,
        Translation.es,
      ],
      home: const HomePage(),
    );
  }
}

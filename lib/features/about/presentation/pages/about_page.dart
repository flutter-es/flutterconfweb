import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/features/about/presentation/widgets/about_about.dart';
import 'package:flutter_conf_latam/features/about/presentation/widgets/about_extra.dart';
import 'package:flutter_conf_latam/features/about/presentation/widgets/about_main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutPage extends ConsumerStatefulWidget {
  const AboutPage({super.key});
  static const String route = '/about';

  @override
  ConsumerState<AboutPage> createState() => _AboutPageState(); 
}

class _AboutPageState extends ConsumerState<AboutPage> {
  final analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    analytics.logScreenView(screenName: 'about_page');
  }
   @override
    Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            const AboutMain(),
            const AboutAbout(),
            const AboutExtra(),
            const Footer(),
          ]),
        ),
      ],
    );
  }
}

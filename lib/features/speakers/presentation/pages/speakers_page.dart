import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/features/speakers/presentation/widgets/speakers_main.dart';

class SpeakersPage extends StatefulWidget {
  const SpeakersPage({super.key});

  @override
  State<SpeakersPage> createState() => _SpeakersPageState();
}

class _SpeakersPageState extends State<SpeakersPage> {
  final analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    unawaited(analytics.logScreenView(screenName: 'speakers_page'));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            const SpeakersMain(),
            const Footer(),
          ]),
        ),
      ],
    );
  }
}

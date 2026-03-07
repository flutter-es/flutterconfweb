import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/core/widgets/container/pricing_container.dart';

class PricingPage extends StatefulWidget {
  const PricingPage({super.key});

  @override
  State<PricingPage> createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage> {
  final analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    unawaited(analytics.logScreenView(screenName: 'pricing_page'));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            const PricingContainer(),
            const Footer(),
          ]),
        ),
      ],
    );
  }
}

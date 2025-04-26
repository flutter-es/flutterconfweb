import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/datelocation_container.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/event_features_container.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  static const String route = '/home';

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    analytics.logScreenView(screenName: 'home_page');
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            HomeContainer(),
            const DateLocationContainer(),
            const EventFeaturesContainer(),
          ]),
        ),
      ],
    );
  }
}

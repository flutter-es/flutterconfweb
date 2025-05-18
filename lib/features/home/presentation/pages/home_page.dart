import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_collaborations.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_communities.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_faq.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_features.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_main.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_novelties.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_pricing.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

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
            const HomeMain(),
            const HomeFeatures(),
            const HomeNovelties(),
            const HomePricing(),
            const HomeCollaborations(),
            const HomeCommunities(),
            const HomeFaq(),
            const Footer(),
          ]),
        ),
      ],
    );
  }
}

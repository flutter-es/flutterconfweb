import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_collaborations.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_faq.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_features.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_main.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_novelties.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
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
    final dividerIndent = switch (context.screenSize) {
      ScreenSize.extraLarge => 120.0,
      ScreenSize.large => 72.0,
      ScreenSize.normal || ScreenSize.small => 48.0,
    };

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            const HomeMain(),
            const HomeFeatures(),
            const HomeNovelties(),
            // const HomePricing(),
            const HomeCollaborations(),
            // const HomeCommunities(),
            const HomeFaq(),
            Divider(
              indent: dividerIndent,
              endIndent: dividerIndent,
              color: FlutterLatamColors.white,
            ),
            // TODO(FV): Enable later
            // const Footer(),
          ]),
        ),
      ],
    );
  }
}

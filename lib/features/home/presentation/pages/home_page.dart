import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/home/data/models/home_section.dart';
import 'package:flutter_conf_colombia/features/home/data/models/tab_section.dart';
import 'package:flutter_conf_colombia/features/home/presentation/providers/home_providers.dart';
import 'package:flutter_conf_colombia/features/home/presentation/widgets/custom_tab_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  static const String route = '/home';

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late CustomTabController tabController;
  late List<HomeSection> sections;
  late List<TabSection> tabSections;

  bool isScrolled = false;

  final analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    analytics
      ..setCurrentScreen(screenName: 'home_page')
      ..logScreenView(screenName: 'home_page');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sections = ref.watch(homeSectionsProvider);

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            ...sections.map((e) => e.builder(context)),
          ]),
        ),
      ],
    );
  }
}

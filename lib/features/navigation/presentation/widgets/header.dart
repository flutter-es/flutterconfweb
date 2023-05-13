import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/home/data/models/home_section.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/animations/flutter_logo_animated.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/l10n/support_locale.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Header extends ConsumerWidget {
  const Header({
    required this.tabController,
    required this.sections,
    required this.onTap,
    super.key,
  });

  final TabController tabController;
  final List<HomeSection> sections;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      pinned: true,
      expandedHeight: 250,
      collapsedHeight: 100,
      flexibleSpace: Container(
        height: 250,
        margin: const EdgeInsets.only(bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(child: FlutterLogoAnimated()),
            Spacer() // for the localization buttons
          ],
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            ref.read(currentLocalizationProvider.notifier).state = SupportLocale.es;
            //FlutterConf.setLocale(context, SupportLocale.es);
          },
          child: const Text(
            'Español',
            style: TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {
            ref.read(currentLocalizationProvider.notifier).state = SupportLocale.en;
          },
          child: const Text(
            'English',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
      bottom: TabBar(
        onTap: onTap,
        controller: tabController,
        isScrollable: true,
        indicatorWeight: 1.0,
        indicatorColor: Colors.white,
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.grey,
        tabs: [
          for (final section in sections)
            Tab(
              text: section.title,
            ),
        ],
      ),
    );
  }
}

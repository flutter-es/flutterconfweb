import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_conf_colombia/ui/entities/home_section.dart';
import 'package:flutter_conf_colombia/ui/widgets/animations/flutter_logo_animated.dart';

class Header extends StatelessWidget {
  Header({
    required this.tabController,
    required this.sections,
    required this.onTap,
    super.key,
  });

  final TabController tabController;
  final List<HomeSection> sections;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
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
        )
      ),
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

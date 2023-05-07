import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_conf_colombia/ui/entities/home_section.dart';

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
      title: Container(
        height: 100.0,
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

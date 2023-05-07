import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/main.dart';
import 'package:flutter_conf_colombia/ui/entities/home_section.dart';
import 'package:flutter_conf_colombia/ui/internations/translation.dart';

class Header extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      pinned: true,
      title: Container(
        height: 100.0,
      ),
      actions: [
        InkWell(
          onTap: () {
            FlutterCon.setLocale(context, Translation.es);
          },
          child: const Text(
            'Español',
            style: TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {
            FlutterCon.setLocale(context, Translation.en);
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
              text: Translation.of(context, section.title),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/home/data/models/home_section.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/animations/flutter_logo_animated.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
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
    const maxHeight = 120.0;

    return SliverAppBar(
      backgroundColor: Colors.white,
      pinned: true,
      expandedHeight: maxHeight,
      collapsedHeight: kToolbarHeight,
      flexibleSpace: Stack(
        children: [
          Positioned(
            left: 50.0,
            top: 0.0,
            bottom: 0.0,
            child: LayoutBuilder(
              builder: (_, constraint) {
                final currentHeight = constraint.maxHeight;
                final currentWidth = currentHeight * 220.0 / maxHeight;

                const maxPadding = 20.8;

                final percent = (currentHeight - kToolbarHeight) *
                    100 /
                    (maxHeight - kToolbarHeight);

                final left = maxPadding - (maxPadding * percent / 100);

                return Container(
                  margin: EdgeInsets.only(
                    left: left.abs(),
                  ),
                  width: currentWidth,
                  height: currentHeight,
                  child: const FlutterLogoAnimated(),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TabBar(
              onTap: onTap,
              controller: tabController,
              isScrollable: true,
              indicatorWeight: 1.0,
              indicatorColor: Colors.white,
              labelColor: FlutterLatamColors.darkBlue,
              unselectedLabelColor: Colors.grey,
              tabs: [
                for (final section in sections)
                  Tab(
                    text: section.title,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

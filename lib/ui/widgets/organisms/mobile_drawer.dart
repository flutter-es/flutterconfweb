import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/ui/entities/home_section.dart';
import 'package:flutter_conf_colombia/ui/widgets/molecules/item_drawer.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({
    required this.tabController,
    required this.sections,
    required this.onTap,
    super.key,
  });

  final List<HomeSection> sections;
  final ValueChanged<int> onTap;
  final ValueNotifier<int> tabController;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      backgroundColor: Colors.blue,
      child: ValueListenableBuilder(
        valueListenable: tabController,
        builder: (_, index, __) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      color: Colors.grey[200],
                    ),
                  ],
                ),
                for (var i = 0; i < sections.length; i++)
                  ItemDrawer(
                    section: sections[i],
                    isSelected: index == i,
                    onTap: () {
                      tabController.value = i;

                      onTap(i);
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

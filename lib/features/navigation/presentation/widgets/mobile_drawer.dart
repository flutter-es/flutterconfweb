import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/home/data/models/home_section.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/widgets/item_drawer.dart';
import 'package:flutter_conf_colombia/helpers/constants.dart';
import 'package:flutter_conf_colombia/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_svg/svg.dart';

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
              vertical: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('${Constants.imagesPath}/FlutterLogo_White.svg',
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
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
                ),
                Row(
                  children: const [
                    Icon(FlutterConfLatamIcons.flutteconflatam_text, size: 80, color: Colors.white),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

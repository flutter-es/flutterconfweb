import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/providers/navigation_provider.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/widgets/item_drawer.dart';
import 'package:flutter_conf_latam/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class MobileDrawer extends ConsumerStatefulWidget {
  const MobileDrawer({super.key});

  @override
  MobileDrawerState createState() => MobileDrawerState();
}

class MobileDrawerState extends ConsumerState<MobileDrawer> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(navigationViewmodelProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabItems = ref.watch(navigationViewmodelProvider);
    final visibleTabItems = tabItems.where((t) => t.display ?? false).toList();

    return Drawer(
      backgroundColor: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      ref
                          .read(navigationViewmodelProvider.notifier)
                          .selectNavItemFromRoute(HomePage.route);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox.square(
                        dimension: 80,
                        child: SvgPicture.asset(Assets.images.flutterLogoWhite),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  for (var i = 0; i < visibleTabItems.length; i++)
                    ItemDrawer(
                      item: visibleTabItems[i],
                      onTap: () {
                        Navigator.of(context).pop();
                        ref
                            .read(navigationViewmodelProvider.notifier)
                            .selectNavItem(visibleTabItems[i]);
                      },
                    ),
                ],
              ),
            ),
            const Row(
              children: [
                Icon(
                  FlutterConfLatamIcons.flutterConfLatamText,
                  size: 80,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

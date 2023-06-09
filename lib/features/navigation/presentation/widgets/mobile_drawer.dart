import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/home/data/models/home_section.dart';
import 'package:flutter_conf_colombia/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_colombia/features/navigation/data/models/tab_navigation_item.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/providers/navigation_providers.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/widgets/item_drawer.dart';
import 'package:flutter_conf_colombia/features/shared/providers/shared_providers.dart';
import 'package:flutter_conf_colombia/helpers/constants.dart';
import 'package:flutter_conf_colombia/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class MobileDrawer extends ConsumerStatefulWidget {
  const MobileDrawer({
    super.key,
  });

  @override
  MobileDrawerState createState() => MobileDrawerState();
}

class MobileDrawerState extends ConsumerState<MobileDrawer> {

  @override
  void initState() {
    super.initState();

    ref.read(webLocalStorageProvider).initLocalStorage().then((value) {
      ref.read(navigationItemsProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {

    final tabItems = ref.watch(navigationItemsProvider);
    final visibleTabItems = tabItems.where((t) => t.display!).toList();

    return Drawer(
      backgroundColor: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 40.0,
        ),
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
                      ref.read(navigationItemsProvider.notifier).selectNavItemFromRoute(HomePage.route);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('${Constants.imagesPath}/FlutterLogo_White.svg',
                        width: 80,
                        height: 80,
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
                        ref.read(navigationItemsProvider.notifier).selectNavItem(visibleTabItems[i]);
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
      ),
    );
  }
}

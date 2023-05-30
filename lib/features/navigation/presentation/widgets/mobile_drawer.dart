import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/home/data/models/home_section.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/providers/navigation_providers.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/widgets/item_drawer.dart';
import 'package:flutter_conf_colombia/helpers/constants.dart';
import 'package:flutter_conf_colombia/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class MobileDrawer extends ConsumerWidget {
  const MobileDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final tabItems = ref.watch(navigationItemsProvider);

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
                  for (var i = 0; i < tabItems.length; i++)
                    ItemDrawer(
                      item: tabItems[i]
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

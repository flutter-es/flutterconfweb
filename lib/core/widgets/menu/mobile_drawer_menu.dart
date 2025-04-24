import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_latam/features/navigation/data/models/navigation_item_model.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/providers/navigation_provider.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class MobileDrawerMenu extends ConsumerWidget {
  const MobileDrawerMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabItems = ref.watch(navigationViewmodelProvider);
    final visibleTabItems = tabItems.where((item) => item.display).toList();

    return Drawer(
      backgroundColor: FlutterLatamColors.lightBlue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.topLeft,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      ref
                          .read(navigationViewmodelProvider.notifier)
                          .selectNavItemFromRoute(HomePage.route);
                    },
                    child: SizedBox.square(
                      dimension: 80,
                      child: SvgPicture.asset(Assets.images.flutterLogoWhite),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  for (var i = 0; i < visibleTabItems.length; i++)
                    _ItemDrawer(
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
            const Align(
              alignment: Alignment.bottomLeft,
              child: Icon(
                FlutterConfLatamIcons.flutterConfLatamText,
                color: FlutterLatamColors.white,
                size: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemDrawer extends StatelessWidget {
  const _ItemDrawer({required this.item, required this.onTap});

  final NavigationItemModel item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(60)),
        child: SizedBox(
          height: 60,
          child: InkWell(
            onTap: onTap,
            borderRadius: const BorderRadius.all(Radius.circular(60)),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: switch (item.isSelected) {
                true => BoxDecoration(
                  color: FlutterLatamColors.white.withValues(alpha: .12),
                ),
                false => null,
              },
              child: Text(
                item.label,
                style: FlutterConfLatamStyles.label4.copyWith(
                  color: switch (item.isSelected) {
                    true => FlutterLatamColors.white,
                    false => FlutterLatamColors.black,
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

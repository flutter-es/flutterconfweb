import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/routes/app_route_path.dart';
import 'package:flutter_conf_latam/core/widgets/menu/extra_buttons.dart';
import 'package:flutter_conf_latam/core/widgets/menu/language_button.dart';
import 'package:flutter_conf_latam/features/navigation/data/models/navigation_item_model.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/providers/navigation_provider.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobileDrawerMenu extends ConsumerWidget {
  const MobileDrawerMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabItems = ref.watch(navigationViewmodelProvider);
    final visibleTabItems = tabItems.where((item) => item.display).toList();

    return Drawer(
      backgroundColor: FlutterLatamColors.mainBlue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
        child: Column(
          spacing: 20,
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
                      _goToHome(ref);
                    },
                    child: Image.asset(Assets.images.fclEcMainLogo),
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
            const ExtraButtons(position: ButtonPosition.column),
            const LanguageButton(),
          ],
        ),
      ),
    );
  }

  void _goToHome(WidgetRef ref) {
    ref
        .read(navigationViewmodelProvider.notifier)
        .selectNavItemFromRoute('/${AppRoutePath.home.pathName}');
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
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: switch (item.isSelected) {
                true => BoxDecoration(
                  color: FlutterLatamColors.white.withValues(alpha: .12),
                ),
                false => null,
              },
              child: Text(
                item.label,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: FlutterLatamColors.white,
                  fontWeight: switch (item.isSelected) {
                    true => FontWeight.w600,
                    false => FontWeight.w400,
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

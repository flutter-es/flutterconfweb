import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/routes/helpers/navigation_item_model.dart';
import 'package:flutter_conf_latam/core/widgets/menu/extra_buttons.dart';
import 'package:flutter_conf_latam/core/widgets/menu/language_button.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';

class MobileDrawerMenu extends StatelessWidget {
  const MobileDrawerMenu({
    required this.tabItems,
    required this.onSelect,
    super.key,
  });

  final List<NavigationItemModel> tabItems;
  final ValueSetter<NavigationItemModel> onSelect;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: FlutterLatamColors.mainBlue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  for (final (index, item) in tabItems.indexed)
                    if (index == 0)
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            height: 80,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                onSelect(item);
                              },
                              child: Image.asset(Assets.images.fclEcMainLogo),
                            ),
                          ),
                        ),
                      )
                    else
                      _ItemDrawer(
                        item: item,
                        onTap: () {
                          Navigator.of(context).pop();
                          onSelect(item);
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

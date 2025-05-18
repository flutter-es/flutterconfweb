import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/routes/helpers/navigation_item_model.dart';
import 'package:flutter_conf_latam/core/widgets/menu/extra_buttons.dart';
import 'package:flutter_conf_latam/core/widgets/menu/language_button.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Header extends HookWidget {
  const Header({required this.tabItems, required this.onSelect, super.key});

  final List<NavigationItemModel> tabItems;
  final ValueSetter<NavigationItemModel> onSelect;

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(
      initialLength: tabItems.length,
      initialIndex: tabItems.indexWhere((item) => item.isSelected),
    );

    return SliverAppBar(
      pinned: true,
      elevation: 0,
      collapsedHeight: 100,
      expandedHeight: 120,
      backgroundColor: FlutterLatamColors.mainBlue,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 122),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TabBar(
                onTap: (index) => onSelect(tabItems[index]),
                controller: tabController,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                indicatorWeight: 1,
                dividerColor: Colors.transparent,
                labelColor: FlutterLatamColors.darkBlue,
                indicatorColor: switch (tabController.index) {
                  0 => Colors.transparent,
                  _ => FlutterLatamColors.white,
                },
                unselectedLabelColor: FlutterLatamColors.silver,
                tabs: <Widget>[
                  for (final (index, item) in tabItems.indexed)
                    if (index == 0)
                      LayoutBuilder(
                        builder: (_, constraint) {
                          return SizedBox(
                            height: constraint.maxHeight,
                            child: Image.asset(Assets.images.fclEcMainLogo),
                          );
                        },
                      )
                    else
                      Tab(
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
                ],
              ),
            ),
            const ExtraButtons(position: ButtonPosition.row),
            const LanguageButton(),
          ],
        ),
      ),
    );
  }
}

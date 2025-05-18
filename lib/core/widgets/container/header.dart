import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/routes/helpers/navigation_view_model.dart';
import 'package:flutter_conf_latam/core/widgets/menu/extra_buttons.dart';
import 'package:flutter_conf_latam/core/widgets/menu/language_button.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Header extends HookConsumerWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabItems = ref.watch(navigationViewModelProvider);
    final tabController = useTabController(initialLength: tabItems.length);

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
                onTap: (index) {
                  ref
                      .read(navigationViewModelProvider.notifier)
                      .selectNavItem(tabItems[index]);
                },
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
                  for (final tabItem in tabItems)
                    if (tabItem.display)
                      Tab(
                        child: Text(
                          tabItem.label,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            color: FlutterLatamColors.white,
                            fontWeight: switch (tabItem.isSelected) {
                              true => FontWeight.w600,
                              false => FontWeight.w400,
                            },
                          ),
                        ),
                      )
                    else
                      LayoutBuilder(
                        builder: (_, constraint) {
                          return SizedBox(
                            height: constraint.maxHeight,
                            child: Image.asset(Assets.images.fclEcMainLogo),
                          );
                        },
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

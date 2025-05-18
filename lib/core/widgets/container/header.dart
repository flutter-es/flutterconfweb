import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/routes/app_route_path.dart';
import 'package:flutter_conf_latam/core/widgets/menu/language_button.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/providers/navigation_provider.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Header extends HookConsumerWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabItems = ref.watch(navigationViewmodelProvider);
    final tabController = useTabController(initialLength: tabItems.length);

    return SliverAppBar(
      pinned: true,
      elevation: 0,
      collapsedHeight: 100,
      expandedHeight: 120,
      backgroundColor: FlutterLatamColors.mainBlue,
      flexibleSpace: Row(
        children: <Widget>[
          LayoutBuilder(
            builder: (_, constraint) {
              return Container(
                margin: const EdgeInsets.only(left: 20),
                height: constraint.maxHeight,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => _goToHome(ref),
                    child: Image.asset(Assets.images.fclEcMainLogo),
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: TabBar(
              onTap: (index) {
                ref
                    .read(navigationViewmodelProvider.notifier)
                    .selectNavItem(tabItems[index]);
              },
              controller: tabController,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorWeight: 1,
              dividerColor: Colors.transparent,
              labelColor: FlutterLatamColors.darkBlue,
              indicatorColor: FlutterLatamColors.white,
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
                    const Offstage(),
              ],
            ),
          ),
          const LanguageButton(),
        ],
      ),
    );
  }

  void _goToHome(WidgetRef ref) {
    ref
        .read(navigationViewmodelProvider.notifier)
        .selectNavItemFromRoute('/${AppRoutePath.home.pathName}');
  }
}

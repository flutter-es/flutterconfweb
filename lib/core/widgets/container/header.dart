import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/routes/app_route_path.dart';
import 'package:flutter_conf_latam/core/widgets/menu/language_button.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/providers/navigation_provider.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Header extends ConsumerStatefulWidget {
  const Header({super.key});

  @override
  HeaderState createState() => HeaderState();
}

class HeaderState extends ConsumerState<Header> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final tabItems = ref.watch(navigationViewmodelProvider);
    final visibleTabItems = tabItems.where((item) => item.display).toList();

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
                    onTap: _goToHome,
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
                    .selectNavItem(visibleTabItems[index]);
              },
              controller: TabController(
                length: visibleTabItems.length,
                vsync: this,
              ),
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorWeight: 1,
              dividerColor: Colors.transparent,
              labelColor: FlutterLatamColors.darkBlue,
              indicatorColor: FlutterLatamColors.white,
              unselectedLabelColor: FlutterLatamColors.silver,
              tabs: <Widget>[
                for (final tabItem in visibleTabItems)
                  Tab(
                    child: Text(
                      tabItem.label,
                      style: TextStyle(
                        color: switch (tabItem.isSelected) {
                          true => FlutterLatamColors.darkBlue,
                          false => FlutterLatamColors.silver,
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const LanguageButton(),
        ],
      ),
    );
  }

  void _goToHome() {
    ref
        .read(navigationViewmodelProvider.notifier)
        .selectNavItemFromRoute('/${AppRoutePath.home.pathName}');
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/enums/enums.dart';
import 'package:flutter_conf_latam/core/widgets/animations/flutter_rive_animated.dart';
import 'package:flutter_conf_latam/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/custom_tab_controller.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/providers/navigation_providers.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/responsiveness/navigation_responsive_config.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/widgets/language_button.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Header extends ConsumerStatefulWidget {
  const Header({super.key});

  @override
  HeaderState createState() => HeaderState();
}

class HeaderState extends ConsumerState<Header> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(navigationItemsProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiConfig = NavigationResponsiveConfig.getNavigationConfig(context);
    final tabItems = ref.watch(navigationItemsProvider);
    final visibleTabItems = tabItems.where((t) => t.display ?? false).toList();

    return SliverAppBar(
      backgroundColor: Colors.white,
      pinned: true,
      elevation: 0,
      expandedHeight: uiConfig.maxHeaderHeight,
      collapsedHeight: kToolbarHeight,
      flexibleSpace: Stack(
        children: [
          Positioned(
            left: 50,
            top: 0,
            bottom: 0,
            child: LayoutBuilder(
              builder: (_, constraint) {
                final currentHeight = constraint.maxHeight;
                final currentWidth =
                    currentHeight *
                    uiConfig.logoHeight /
                    uiConfig.maxHeaderHeight;

                const maxPadding = 20.8;

                final percent =
                    (currentHeight - kToolbarHeight) *
                    100 /
                    (uiConfig.maxHeaderHeight - kToolbarHeight);

                final left = maxPadding - (maxPadding * percent / 100);

                return Container(
                  margin: EdgeInsets.only(left: left.abs()),
                  width: currentWidth,
                  height: currentHeight,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        ref
                            .read(navigationItemsProvider.notifier)
                            .selectNavItemFromRoute(HomePage.route);
                      },
                      child: const FlutterRiveAnimated(
                        path: './assets/anims/flutterconflogo.riv',
                        animation: FlutterConfAnimations.flutterConfLogo,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TabBar(
              onTap: (index) {
                final navItem = visibleTabItems[index];
                ref
                    .read(navigationItemsProvider.notifier)
                    .selectNavItem(navItem);
              },
              controller:
                  CustomTabController(
                    length: visibleTabItems.length,
                    vsync: this,
                  ).build(),
              isScrollable: true,
              indicatorWeight: 1,
              indicatorColor: Colors.white,
              labelColor: FlutterLatamColors.darkBlue,
              unselectedLabelColor: Colors.grey,
              tabs: [
                for (final tabItem in visibleTabItems)
                  Tab(
                    child: Text(
                      tabItem.label,
                      style: TextStyle(
                        color:
                            tabItem.isSelected!
                                ? FlutterLatamColors.darkBlue
                                : Colors.grey,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const Align(alignment: Alignment.topRight, child: LanguageButton()),
        ],
      ),
    );
  }
}

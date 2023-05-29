import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/home/presentation/widgets/custom_tab_controller.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/providers/navigation_providers.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/responsiveness/navigation_responsive_config.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/widgets/language_button.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/animations/flutter_logo_animated.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Header extends ConsumerStatefulWidget {

  const Header({
    super.key,
  });

  @override
  HeaderState createState() => HeaderState();
}

class HeaderState extends ConsumerState<Header> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    
    final uiConfig = NavigationResponsiveConfig.getNavigationConfig(context);
    final tabItems = ref.watch(navigationItemsProvider);

    return SliverAppBar(
      backgroundColor: Colors.white,
      pinned: true,
      expandedHeight: uiConfig.maxHeaderHeight,
      collapsedHeight: kToolbarHeight,
      flexibleSpace: Stack(
        children: [
          Positioned(
            left: 50.0,
            top: 0.0,
            bottom: 0.0,
            child: LayoutBuilder(
              builder: (_, constraint) {
                final currentHeight = constraint.maxHeight;
                final currentWidth = currentHeight * uiConfig.logoHeight / uiConfig.maxHeaderHeight;

                const maxPadding = 20.8;

                final percent = (currentHeight - kToolbarHeight) *
                    100 /
                    (uiConfig.maxHeaderHeight - kToolbarHeight);

                final left = maxPadding - (maxPadding * percent / 100);

                return Container(
                  margin: EdgeInsets.only(
                    left: left.abs(),
                  ),
                  width: currentWidth,
                  height: currentHeight,
                  child: const FlutterLogoAnimated(),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TabBar(
              onTap: (index) {
                // 
                GoRouter.of(context).go(tabItems[index].route);
              },
              controller: CustomTabController(length: tabItems.length, vsync: this).build(),
              isScrollable: true,
              indicatorWeight: 1.0,
              indicatorColor: Colors.white,
              labelColor: FlutterLatamColors.darkBlue,
              unselectedLabelColor: Colors.grey,
              tabs: [
                for (final tabItem in tabItems)
                  Tab(
                    text: tabItem.label,
                  ),
              ],
            ),
          ),
           const Align(
            alignment: Alignment.topRight,
            child: LanguageButton(),
          )
        ],
      ),
    );
  }
}

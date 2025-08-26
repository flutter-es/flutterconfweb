import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/routes/helpers/navigation_item_model.dart';
import 'package:flutter_conf_latam/core/routes/helpers/navigation_view_model.dart';
import 'package:flutter_conf_latam/core/widgets/animations/marquee_text_animation.dart';
import 'package:flutter_conf_latam/core/widgets/menu/header_menu.dart';
import 'package:flutter_conf_latam/core/widgets/menu/mobile_drawer_menu.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShellNavigatorPage extends ConsumerStatefulWidget {
  const ShellNavigatorPage({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<ShellNavigatorPage> createState() => _ShellNavigatorPageState();
}

class _ShellNavigatorPageState extends ConsumerState<ShellNavigatorPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(navigationViewModelProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(appLocalizationsProvider);
    final tabItems = ref.watch(
      navigationViewModelProvider.select(
        (value) => value.where((item) => item.visible).toList(),
      ),
    );

    ref.listen(navigationViewModelProvider, (previous, next) {
      if (listEquals(previous, next)) return;

      final itemRoute = next.singleWhereOrNull((item) => item.isSelected);
      if (itemRoute != null) {
        if ((itemRoute.route ?? '').isNotEmpty) {
          context.go(itemRoute.route!);
        } else if ((itemRoute.subMenus ?? []).isNotEmpty) {
          final subItemRoute = itemRoute.subMenus?.singleWhereOrNull(
            (item) => item.isSelected,
          );
          if (subItemRoute != null && subItemRoute.route.isNotEmpty) {
            context.go(subItemRoute.route);
          }
        }
      }
    });

    return Scaffold(
      backgroundColor: FlutterLatamColors.mainBlue,
      appBar: switch (context.isMobileFromResponsive) {
        true => AppBar(
          backgroundColor: FlutterLatamColors.mainBlue,
          leadingWidth: 90,
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              mouseCursor: SystemMouseCursors.click,
              onTap: switch (tabItems.isNotEmpty) {
                true => () => _goToRoute(tabItems.first),
                false => null,
              },
              child: Image.asset(
                Assets.images.fclEcMainLogo,
                semanticLabel: l10n.menuHomeText,
              ),
            ),
          ),
        ),
        false => null,
      },
      endDrawer: switch (context.isMobileFromResponsive) {
        true => MobileDrawerMenu(tabItems: tabItems, onSelect: _goToRoute),
        false => null,
      },
      body: Column(
        children: <Widget>[
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (_, _) {
                return [
                  if (!context.isMobileFromResponsive)
                    HeaderMenu(tabItems: tabItems, onSelect: _goToRoute),
                ];
              },
              body: widget.child,
            ),
          ),
          SizedBox(
            height: switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => 56,
              ScreenSize.normal || ScreenSize.small => 40,
            },
            child: ColoredBox(
              color: FlutterLatamColors.yellow,
              child: MarqueeTextAnimation(text: l10n.marqueeDisclaimer),
            ),
          ),
        ],
      ),
    );
  }

  void _goToRoute(NavigationItemModel item) {
    ref.read(navigationViewModelProvider.notifier).selectNavItem(item);
  }
}

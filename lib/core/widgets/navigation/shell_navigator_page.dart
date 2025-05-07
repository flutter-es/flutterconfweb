import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/container/header.dart';
import 'package:flutter_conf_latam/core/widgets/menu/mobile_drawer_menu.dart';
import 'package:flutter_conf_latam/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/providers/navigation_provider.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      ref.read(navigationViewmodelProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO(FV): Review this
    /*
    ref.listen(navigationViewmodelProvider, (_, value) {
      if (value.isNotEmpty) {
        final itemRoute = value.singleWhereOrNull((item) => item.isSelected);
        if (itemRoute != null && itemRoute.route.isNotEmpty) {
          context.go(itemRoute.route);
        }
      }
    });
    */

    return Scaffold(
      backgroundColor: FlutterLatamColors.mainBlue,
      appBar: switch (context.isMobileFromResponsive) {
        true => AppBar(
          backgroundColor: FlutterLatamColors.mainBlue,
          leadingWidth: 90,
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: InkWell(
                onTap: () {
                  ref
                      .read(navigationViewmodelProvider.notifier)
                      .selectNavItemFromRoute(HomePage.route);
                },
                child: Image.asset(Assets.images.fclEcMainLogo),
              ),
            ),
          ),
        ),
        false => null,
      },
      endDrawer: switch (context.isMobileFromResponsive) {
        true => const MobileDrawerMenu(),
        false => null,
      },
      body: Column(
        children: <Widget>[
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (_, __) {
                return [if (!context.isMobileFromResponsive) const Header()];
              },
              body: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/extensions/extension_methods.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/core/widgets/container/header.dart';
import 'package:flutter_conf_latam/core/widgets/menu/language_button.dart';
import 'package:flutter_conf_latam/core/widgets/menu/mobile_drawer_menu.dart';
import 'package:flutter_conf_latam/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/providers/navigation_provider.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      appBar: switch (context.isMobileFromResponsive) {
        true => AppBar(
          title: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () {
                ref
                    .read(navigationViewmodelProvider.notifier)
                    .selectNavItemFromRoute(HomePage.route);
              },
              child: SizedBox.square(
                dimension: 40,
                child: SvgPicture.asset(Assets.images.flutterLogoColor),
              ),
            ),
          ),
          actions: const [LanguageButton()],
        ),
        false => null,
      },
      drawer: context.isMobileFromResponsive ? const MobileDrawerMenu() : null,
      body: Column(
        children: <Widget>[
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (_, __) {
                return [if (!context.isMobileFromResponsive) const Header()];
              },
              body: Column(
                children: <Widget>[
                  Expanded(child: widget.child),
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

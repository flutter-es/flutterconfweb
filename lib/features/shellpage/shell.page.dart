import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/providers/navigation_providers.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/widgets/footer.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/widgets/header.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/widgets/language_button.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/widgets/mobile_drawer.dart';
import 'package:flutter_conf_latam/helpers/constants.dart';
import 'package:flutter_conf_latam/helpers/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ShellPage extends ConsumerWidget {
  const ShellPage({required this.child, super.key});

  static const String route = '/main';
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = getValueForScreenType(
      context: context,
      mobile: true,
      tablet: true,
      desktop: false,
    );

    return Scaffold(
      key: Utils.mainScaffold,
      appBar:
          isMobile
              ? AppBar(
                title: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(navigationItemsProvider.notifier)
                          .selectNavItemFromRoute(HomePage.route);
                    },
                    child: SvgPicture.asset(
                      '${Constants.imagesPath}/flutter_logo_color.svg',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                actions: const [LanguageButton()],
              )
              : null,
      drawer: isMobile ? const MobileDrawer() : null,

      body: Column(
        children: [
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (
                BuildContext context,
                bool innerBoxIsScrolled,
              ) {
                return [if (!isMobile) const Header()];
              },
              body: Column(children: [Expanded(child: child), const Footer()]),
            ),
          ),
        ],
      ),
    );
  }
}

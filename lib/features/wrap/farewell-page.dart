import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/widgets/footer.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/widgets/header.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/widgets/language_button.dart';
import 'package:flutter_conf_colombia/features/sponsors/presentation/widgets/sponsors_container.dart';
import 'package:flutter_conf_colombia/features/wrap/farewell_main_container.dart';
import 'package:flutter_conf_colombia/helpers/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FarewellPage extends StatelessWidget {

  static const String route = '/farewell';

  const FarewellPage({super.key});

  @override
  Widget build(BuildContext context) {

    final isMobile = getValueForScreenType(
      context: context,
      mobile: true,
      tablet: true,
      desktop: false,
    );

    return Scaffold(
      appBar: isMobile
          ? AppBar(
              title: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: SvgPicture.asset(
                  '${Constants.imagesPath}/flutter_logo_color.svg',
                  width: 40,
                  height: 40,
                ),
              ),
              actions: const [
                LanguageButton()
              ],
            )
          : null,
      body: Column(
        children: [
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [ if (!isMobile) const Header(showMenu: false,)];
              },
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          FarewellMainContainer(),
                          SponsorsContainer(wrapUp: true,)
                        ],
                      ),
                    )
                  ),
                  Footer()
                ],
              )
            )
          ),
        ],
      ),
    );
  }
}

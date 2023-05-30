import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/widgets/footer.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/widgets/header.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/widgets/language_button.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/widgets/mobile_drawer.dart';
import 'package:flutter_conf_colombia/helpers/constants.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ShellPage extends StatelessWidget {

  static const String route = '/main';
  final Widget child;
  
  const ShellPage({
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    final isMobile = getValueForScreenType(
      context: context,
      mobile: true,
      tablet: true,
      desktop: false,
    );
    
    return Scaffold(
      key: Utils.mainScaffold,
      appBar: isMobile
          ? AppBar(
              title: SvgPicture.asset(
                '${Constants.imagesPath}/flutter_logo_color.svg',
                width: 40,
                height: 40,
              ),
              actions: const [
                LanguageButton()
              ],
            )
          : null,
      drawer: isMobile
          ? MobileDrawer()
          : null,
      
      body: Column(
        children: [
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [ if (!isMobile) const Header()];
              },
              body: Column(
                children: [
                  Expanded(child: child),
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
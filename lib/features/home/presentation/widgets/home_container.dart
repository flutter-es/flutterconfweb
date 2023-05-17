import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/cfp/presentation/providers/cfpfeature_providers.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/animations/flutter_dash_animations.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/circleround_iconbutton.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeContainer extends ConsumerWidget {
  const HomeContainer({super.key});

  static const height = 700.0;

  static const title = 'home_container';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cfpSectionData = ref.watch(cfpSectionProvider);

    final isRow = getValueForScreenType(
      context: context,
      mobile: false,
      tablet: false,
      desktop: true,
    );

    return SizedBox(
      height: height,
      child: isRow
          ? Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 85.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Expanded(child: Offstage()),
                        const Text(
                          '¡Hola Latinoamérica,\nnos vemos pronto!',
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        Text(
                          'El evento de Flutter en español más esperado en toda Latinoamérica unida,\n'
                          'que reune por 2 días a más de 30 speakers de todo LATAM',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                        const SizedBox(height: 60.0),
                        Row(
                          children: [
                            CircleRoundIconButton(
                              icon: FlutterConfLatamIcons.speaker,
                              label: cfpSectionData.cfpButtonLabel,
                              iconColor: Colors.white,
                              backgroundColor: FlutterLatamColors.lightBlue,
                              labelColor: Colors.white,
                              circleColor: FlutterLatamColors.darkBlue,
                              labelWeight: FontWeight.w600,
                              fontSize: 20.0,
                              iconSize: 20.0,
                              iconPadding: 15.0,
                              onTap: () {
                                Utils.launchUrlLink(cfpSectionData.cfpUrlLink);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 60.0),
                        const Text(
                          '25 y 26 de Octubre, 2023',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 5.0,
                              ),
                              child: Image.asset(
                                'assets/images/colombia_flag.png',
                                height: 25.0,
                                width: 25.0,
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            const Text(
                              'Medellin, Colombia',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: FlutterLatamColors.darkBlue,
                              ),
                            ),
                          ],
                        ),
                        const Expanded(child: Offstage()),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: const [
                        Positioned(
                          right: 0.0,
                          bottom: -40.0,
                          child: SizedBox(
                            height: 500.0,
                            width: 500.0,
                            child: FlutterDashAnimation(
                              animation: FlutterDashAnimations.flutterdashflag,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40.0),
                const Text(
                  '¡Hola Latinoamérica,\nnos vemos pronto!',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Text(
                    'El evento de Flutter en español más esperado en toda Latinoamérica unida, '
                    'que reune por 2 días a más de 30 speakers de todo LATAM',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleRoundIconButton(
                      icon: FlutterConfLatamIcons.speaker,
                      label: cfpSectionData.cfpButtonLabel,
                      iconColor: Colors.white,
                      backgroundColor: FlutterLatamColors.lightBlue,
                      labelColor: Colors.white,
                      circleColor: FlutterLatamColors.darkBlue,
                      labelWeight: FontWeight.w600,
                      fontSize: 18.0,
                      iconSize: 18.0,
                      iconPadding: 13.0,
                      onTap: () {
                        Utils.launchUrlLink(cfpSectionData.cfpUrlLink);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                const Text(
                  '25 y 26 de Octubre, 2023',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 5.0,
                      ),
                      child: Image.asset(
                        'assets/images/colombia_flag.png',
                        height: 25.0,
                        width: 25.0,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    const Text(
                      'Medellin, Colombia',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: FlutterLatamColors.darkBlue,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Stack(
                    children: const [
                      Positioned(
                        right: 0.0,
                        left: 0.0,
                        bottom: 0.0,
                        child: SizedBox(
                          height: 250.0,
                          width: 250.0,
                          child: FlutterDashAnimation(
                            animation: FlutterDashAnimations.flutterdashflag,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/animations/flutter_dash_animations.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/circleround_iconbutton.dart';
import 'package:flutter_conf_colombia/features/tickets/presentation/providers/ticketfeature_providers.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TicketsContainer extends ConsumerWidget {
  const TicketsContainer({super.key});

  static const height = 600.0;
  static const title = 'tickets_container';

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final ticketSectionData = ref.watch(ticketSectionProvider);

    return Container(
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterLatamColors.ticketBgTopColor,
            FlutterLatamColors.ticketBgBottomColor
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.all(40),
              child: Text(ticketSectionData.slogan,
                textAlign: TextAlign.right, style: const TextStyle(
                  height: 1.25,
                  fontSize: 50, fontWeight: FontWeight.bold,),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.all(40),
              child: CircleRoundIconButton(
                icon: FlutterConfLatamIcons.ticket,
                label: ticketSectionData.ticketBtnLabel,
                iconColor: Colors.white,
                backgroundColor: Colors.white,
                labelColor: Color(0xFF385600),
                circleColor: Color(0xFF385600),
                labelWeight: FontWeight.bold,
                onTap: () {
                  Utils.launchUrlLink(ticketSectionData.ticketLink);
                },
              ),
            ),
          ),

          const Positioned(
            bottom: -250,
            left: 0,
            top: 0,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 900,
                height: 900,
                child: FlutterDashAnimation(
                  animation: FlutterDashAnimations.flutterdashticket,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

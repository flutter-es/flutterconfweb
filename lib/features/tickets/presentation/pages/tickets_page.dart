import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/circleround_iconbutton.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/comingsoon_container.dart';
import 'package:flutter_conf_colombia/features/tickets/presentation/responsiveness/ticket_page_responsive_config.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TicketsPage extends ConsumerWidget {

  static const String route = '/tickets';

  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final uiConfig = TicketPageResponsiveConfig.getTicketPageResponsiveConfig(context);

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: uiConfig.pagePadding,
          child: Column(
            children: [
              Flex(
                direction: uiConfig.headerDirection,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FlutterConfLatamIcons.ticket,
                    size: uiConfig.headerIconSize, color: FlutterLatamColors.blueText,
                  ),
                  uiConfig.headerGap,
                  Text('Tickets', 
                    textAlign: TextAlign.center, 
                    style: uiConfig.headerStyle,
                  ),
                ],
              ),
              uiConfig.pageVerticalGap,
              Text("Curtain up for FlutterConf LATAM '23, which will take place in 2023 in the iconic city of Medellin, in Colombia. Two full days of multiple tracks with in-depth tech talks, workshops, panels, and more. A place where Flutter & Dart experts, GDEs, & hundreds of FlutterDevs will converge in one single place. Your ticket grants access to FlutterConf LATAM 2023.",
                textAlign: TextAlign.center,
              ),
              uiConfig.pageVerticalGap,
              Text('PLEASE CHECK BACK AGAIN SOON WHEN WE WILL HAVE THE TICKET PURCHASE SYSTEM AVAILABLE!', textAlign: TextAlign.center,
                style: uiConfig.subheaderStyle
              ),
              uiConfig.pageVerticalGap,
              CircleRoundIconButton(
                icon: FlutterConfLatamIcons.ticket,
                label: 'Buy your Ticket',
                iconColor: Colors.white,
                backgroundColor: FlutterLatamColors.lightBlue,
                labelColor: Colors.white,
                circleColor: FlutterLatamColors.darkBlue,
                labelWeight: FontWeight.bold,
                fontSize: uiConfig.ticketButtonLabelSize,
                iconSize: uiConfig.ticketButtonIconSize,
                iconPadding: uiConfig.ticketButtonIconPadding,
                onTap: null,
              ),
              FlutterConfLatamStyles.mediumVGap,
              const ComingSoonContainer(),
            ].animate(
              interval: 50.ms,
            ).slideY(
              begin: 1, end: 0,
              curve: Curves.easeInOut,
            ).fadeIn(),
          ),
        ),
      ),
    );
  }
}
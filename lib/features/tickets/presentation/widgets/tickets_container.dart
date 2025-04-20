import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/enums/enums.dart';
import 'package:flutter_conf_latam/features/shared/widgets/animations/flutter_dash_animations.dart';
import 'package:flutter_conf_latam/features/shared/widgets/circleround_iconbutton.dart';
import 'package:flutter_conf_latam/features/tickets/presentation/providers/ticketfeature_providers.dart';
import 'package:flutter_conf_latam/features/tickets/presentation/responsiveness/ticket_banner_responsive_config.dart';
import 'package:flutter_conf_latam/helpers/utils.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TicketsContainer extends ConsumerWidget {
  const TicketsContainer({super.key});

  static double height = 600;
  static const title = 'tickets_container';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketSectionData = ref.watch(ticketSectionProvider);
    final config = TicketBannerResponsiveConfig.getTicketBannerResponsiveConfig(
      context,
    );

    TicketsContainer.height = config.bannerSize;

    return Container(
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterLatamColors.ticketBgTopColor,
            FlutterLatamColors.ticketBgBottomColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: config.titleAlignment,
            child: Container(
              margin: const EdgeInsets.all(40),
              child: Text(
                ticketSectionData.slogan,
                textAlign: config.titleTextAlign,
                style: TextStyle(
                  height: 1.25,
                  fontSize: config.titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: config.dashOffset,
            left: 0,
            top: 0,
            right: 0,
            child: Align(
              alignment: config.dashAlignment,
              child: SizedBox(
                width: config.dashSize,
                height: config.dashSize,
                child: const FlutterDashAnimation(
                  animation: FlutterDashAnimations.flutterDashTicket,
                ),
              ),
            ),
          ),

          Align(
            alignment: config.ticketButtonAlignment,
            child: Container(
              margin: EdgeInsets.all(config.ticketButtonMargin),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: config.ticketButtonColumnCrossAxis,
                mainAxisAlignment: config.ticketButtonColumnMainAxis,
                children: [
                  CircleRoundIconButton(
                    icon: FlutterConfLatamIcons.ticket,
                    label: ticketSectionData.ticketBtnLabel,
                    iconColor: Colors.white,
                    backgroundColor: Colors.white,
                    labelColor: FlutterLatamColors.darkGreen,
                    circleColor: FlutterLatamColors.darkGreen,
                    labelWeight: FontWeight.bold,
                    iconSize: config.ticketButtonIconSize,
                    fontSize: config.ticketButtonLabelSize,
                    iconPadding: config.ticketButtonIconPadding,
                    onTap: () {
                      Utils.launchUrlLink(ticketSectionData.ticketLink);
                    },
                  ),
                  FlutterConfLatamStyles.smallVGap,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

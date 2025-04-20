import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_latam/features/shared/widgets/circleround_iconbutton.dart';
import 'package:flutter_conf_latam/features/tickets/presentation/providers/ticketfeature_providers.dart';
import 'package:flutter_conf_latam/features/tickets/presentation/responsiveness/ticket_page_responsive_config.dart';
import 'package:flutter_conf_latam/helpers/utils.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TicketsPage extends ConsumerWidget {
  const TicketsPage({super.key});

  static const String route = '/tickets';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketSectionData = ref.watch(ticketSectionProvider);
    final appLoc = ref.watch(appLocalizationsProvider);
    final uiConfig = TicketPageResponsiveConfig.getTicketPageResponsiveConfig(
      context,
    );

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: uiConfig.pagePadding,
          child: Column(
            children:
                [
                      Flex(
                        direction: uiConfig.headerDirection,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            FlutterConfLatamIcons.ticket,
                            size: uiConfig.headerIconSize,
                            color: FlutterLatamColors.blueText,
                          ),
                          uiConfig.headerGap,
                          Text(
                            appLoc.tickets,
                            textAlign: TextAlign.center,
                            style: uiConfig.headerStyle,
                          ),
                        ],
                      ),
                      uiConfig.pageVerticalGap,
                      CircleRoundIconButton(
                        icon: FlutterConfLatamIcons.ticket,
                        label: appLoc.getYourTicket,
                        iconColor: Colors.white,
                        backgroundColor: FlutterLatamColors.lightBlue,
                        labelColor: Colors.white,
                        circleColor: FlutterLatamColors.darkBlue,
                        labelWeight: FontWeight.bold,
                        fontSize: uiConfig.ticketButtonLabelSize,
                        iconSize: uiConfig.ticketButtonIconSize,
                        iconPadding: uiConfig.ticketButtonIconPadding,
                        onTap: () {
                          Utils.launchUrlLink(ticketSectionData.ticketLink);
                        },
                      ),
                      FlutterConfLatamStyles.mediumVGap,
                      uiConfig.pageVerticalGap,
                      Text(
                        appLoc.ticketsPageTitle1,
                        textAlign: TextAlign.center,
                        style: uiConfig.subheaderStyle,
                      ),
                      uiConfig.pageVerticalGap,
                      Text(
                        appLoc.ticketsPageParagraph1,
                        textAlign: TextAlign.center,
                      ),
                      uiConfig.pageVerticalGap,
                      Text(
                        appLoc.ticketsPageTitle2,
                        textAlign: TextAlign.center,
                        style: uiConfig.subheaderStyle,
                      ),
                      uiConfig.pageVerticalGap,
                      Text(
                        appLoc.ticketsPageSubtitleExpert,
                        textAlign: TextAlign.center,
                        style: uiConfig.paragraphHeaderStyle,
                      ),
                      FlutterConfLatamStyles.smallVGap,
                      Text(
                        appLoc.ticketsPageParagraphExperts,
                        textAlign: TextAlign.center,
                      ),
                      uiConfig.pageVerticalGap,
                      Text(
                        appLoc.ticketsPageSubtitleNetworking,
                        textAlign: TextAlign.center,
                        style: uiConfig.paragraphHeaderStyle,
                      ),
                      FlutterConfLatamStyles.smallVGap,
                      Text(
                        appLoc.ticketsPageParagraphNetworking,
                        textAlign: TextAlign.center,
                      ),
                      uiConfig.pageVerticalGap,
                      Text(
                        appLoc.ticketsPageSubtitleSwag,
                        textAlign: TextAlign.center,
                        style: uiConfig.paragraphHeaderStyle,
                      ),
                      FlutterConfLatamStyles.smallVGap,
                      Text(
                        appLoc.ticketsPageParagraphSwag,
                        textAlign: TextAlign.center,
                      ),
                      uiConfig.pageVerticalGap,
                      Text(
                        appLoc.ticketsPageTitle3,
                        textAlign: TextAlign.center,
                        style: uiConfig.paragraphHeaderStyle,
                      ),
                      Text(
                        appLoc.ticketsPageBottomParagraph,
                        textAlign: TextAlign.center,
                      ),
                      uiConfig.pageVerticalGap,
                    ]
                    .animate(interval: 50.ms)
                    .slideY(begin: 1, end: 0, curve: Curves.easeInOut)
                    .fadeIn(),
          ),
        ),
      ),
    );
  }
}

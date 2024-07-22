import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/contact/presentation/responsiveness/contact_page_responsive_config.dart';
import 'package:flutter_conf_colombia/helpers/constants.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactPage extends ConsumerWidget {
  const ContactPage({super.key});

  static const String route = '/contact';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = ref.watch(appLocalizationsProvider);
    final uiConfig =
        ContactPageResponsiveConfig.getContactPageResponsiveConfig(context);

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
                    Icons.account_circle,
                    size: uiConfig.headerIconSize,
                    color: FlutterLatamColors.blueText,
                  ),
                  uiConfig.headerGap,
                  Text(
                    appLoc.contact,
                    textAlign: TextAlign.center,
                    style: uiConfig.headerStyle,
                  ),
                ],
              ),
              uiConfig.pageVerticalGap,
              Text(
                appLoc.contactPageTitle,
                textAlign: TextAlign.center,
                style: uiConfig.subheaderStyle,
              ),
              uiConfig.pageVerticalGap,
              Text(
                appLoc.contactPageMainContent,
                textAlign: TextAlign.center,
              ),
              uiConfig.pageVerticalGap,
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Utils.launchUrlLink('mailto:${Constants.conferenceEmail}');
                  },
                  child: Container(
                    margin: uiConfig.contactInfoMargin,
                    padding: uiConfig.contactInfoPadding,
                    child: Flex(
                      direction: uiConfig.contactInfoDirection,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email,
                          color: FlutterLatamColors.lightBlue,
                          size: uiConfig.contactInfoIconSize,
                        ),
                        FlutterConfLatamStyles.smallHGap,
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: uiConfig.contactInfoAlignment,
                          children: [
                            Text(
                              appLoc.contactInfoTitle,
                              style: uiConfig.contactInfoStyle.copyWith(
                                color: FlutterLatamColors.lightBlue,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              Constants.conferenceEmail,
                              style: uiConfig.contactInfoStyle.copyWith(
                                color: FlutterLatamColors.lightBlue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              uiConfig.pageVerticalGap,
              Text(
                appLoc.contactPageSocialMediaTitle,
                style: FlutterConfLatamStyles.h5,
                textAlign: TextAlign.center,
              ),
              FlutterConfLatamStyles.smallVGap,
              Text(
                appLoc.contactPageSubcontent,
                textAlign: TextAlign.center,
              ),
              uiConfig.pageVerticalGap,
              Text(
                appLoc.contactPageSubtitle,
                style: FlutterConfLatamStyles.h5,
                textAlign: TextAlign.center,
              ),
              FlutterConfLatamStyles.smallVGap,
              Text(
                appLoc.contactPageBottomContent,
                textAlign: TextAlign.center,
              ),
              uiConfig.pageVerticalGap,
            ]
                .animate(
                  interval: 50.ms,
                )
                .slideY(
                  begin: 1,
                  end: 0,
                  curve: Curves.easeInOut,
                )
                .fadeIn(),
          ),
        ),
      ),
    );
  }
}

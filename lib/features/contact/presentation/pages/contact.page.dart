import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/contact/presentation/responsiveness/contact_page_responsive_config.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactPage extends ConsumerWidget {

  static const String route = '/contact';

  const ContactPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final uiConfig = ContactPageResponsiveConfig.getContactPageResponsiveConfig(context);

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
                    size: uiConfig.headerIconSize, color: FlutterLatamColors.blueText,
                  ),
                  uiConfig.headerGap,
                  Text('Contact', 
                    textAlign: TextAlign.center, 
                    style: uiConfig.headerStyle,
                  ),
                ],
              ),
              uiConfig.pageVerticalGap,
              Text('Get in touch with the FlutterConf LATAM Team!', textAlign: TextAlign.center,
                style: uiConfig.subheaderStyle
              ),
              uiConfig.pageVerticalGap,
              Text("Would you like to reach out to us? If you have any questions related to anything regarding FlutterConf LATAM,\nplease do not hesitate to reach out to us via email by clicking on the link below, or by reaching us through social media!",
                textAlign: TextAlign.center,
              ),
              uiConfig.pageVerticalGap,
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container(
                    margin: uiConfig.contactInfoMargin,
                    padding: uiConfig.contactInfoPadding,
                    child: Flex(
                      direction: uiConfig.contactInfoDirection,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.email, color: FlutterLatamColors.lightBlue, size: uiConfig.contactInfoIconSize),
                        FlutterConfLatamStyles.smallHGap,
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: uiConfig.contactInfoAlignment,
                          children: [
                            Text("Send Us Email at", style: uiConfig.contactInfoStyle.copyWith(color: FlutterLatamColors.lightBlue, fontWeight: FontWeight.normal)),
                            Text("flutterconflatam@gmail.com", style: uiConfig.contactInfoStyle.copyWith(color: FlutterLatamColors.lightBlue)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              
              uiConfig.pageVerticalGap,
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
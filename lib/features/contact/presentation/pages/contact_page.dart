import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    analytics.logScreenView(screenName: 'contact_page');
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            const _ContactMain(),
            const Footer(),
          ]),
        ),
      ],
    );
  }
}

class _ContactMain extends ConsumerWidget {
  const _ContactMain();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);

    return SectionContainer(
      spacing: 24,
      children: <Widget>[
        TitleSubtitleText(
          title: (
            text: l10n.contactMainTitle,
            size: switch (context.screenSize) {
              ScreenSize.extraLarge => 64,
              ScreenSize.large => 48,
              ScreenSize.normal || ScreenSize.small => 24,
            },
          ),
          subtitle: (
            text: l10n.contactMainDescription,
            size: switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => 24,
              ScreenSize.normal || ScreenSize.small => 16,
            },
          ),
        ),
        const _ContactEmailCard(),
      ],
    );
  }
}

class _ContactEmailCard extends ConsumerWidget {
  const _ContactEmailCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(configProvider);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: FlutterLatamColors.darkBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(switch (context.screenSize) {
          ScreenSize.extraLarge || ScreenSize.large => 28,
          ScreenSize.normal || ScreenSize.small => 12,
        }),
        child: Flex(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          direction: switch (context.screenSize) {
            ScreenSize.extraLarge || ScreenSize.large => Axis.horizontal,
            ScreenSize.normal || ScreenSize.small => Axis.vertical,
          },
          children: <Widget>[
            SizedBox.square(
              dimension: 48,
              child: Image.asset(Assets.images.contact.email),
            ),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  config.contactEmail,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: switch (context.screenSize) {
                      ScreenSize.extraLarge => 32,
                      ScreenSize.large => 24,
                      ScreenSize.normal || ScreenSize.small => 16,
                    },
                    fontWeight: FontWeight.w500,
                    color: FlutterLatamColors.white,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await Clipboard.setData(
                      ClipboardData(text: config.contactEmail),
                    );
                  },
                  child: SizedBox.square(
                    dimension: switch (context.screenSize) {
                      ScreenSize.extraLarge || ScreenSize.large => 32,
                      ScreenSize.normal || ScreenSize.small => 24,
                    },
                    child: SvgPicture.asset(Assets.images.icons.copy),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

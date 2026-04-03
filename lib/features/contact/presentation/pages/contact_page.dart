import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signals/signals_flutter.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  void initState() {
    super.initState();
    unawaited(
      analyticsRepository.value.logScreenView(screenName: 'contact_page'),
    );
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

class _ContactMain extends StatelessWidget {
  const _ContactMain();

  @override
  Widget build(BuildContext context) {
    final l10n = appLocalizations.watch(context);

    return SectionContainer(
      spacing: 24,
      children: <Widget>[
        TitleSubtitleText(
          title: (
            text: l10n.contactMainTitle,
            size: switch (context.screenSize) {
              .extraLarge => 64,
              .large => 48,
              .normal || .small => 24,
            },
          ),
          subtitle: (
            text: l10n.contactMainDescription,
            size: switch (context.screenSize) {
              .extraLarge || .large => 24,
              .normal || .small => 16,
            },
          ),
        ),
        const _ContactEmailCard(),
      ],
    );
  }
}

class _ContactEmailCard extends StatelessWidget {
  const _ContactEmailCard();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.fclThemeScheme;

    final l10n = appLocalizations.watch(context);
    final config = appConfig.watch(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: FlutterLatamColors.darkBlue,
        borderRadius: .circular(20),
      ),
      child: Padding(
        padding: .all(switch (context.screenSize) {
          .extraLarge || .large => 28,
          .normal || .small => 12,
        }),
        child: Flex(
          spacing: 10,
          mainAxisSize: .min,
          mainAxisAlignment: .center,
          direction: switch (context.screenSize) {
            .extraLarge || .large => .horizontal,
            .normal || .small => .vertical,
          },
          children: <Widget>[
            SizedBox.square(
              dimension: 48,
              child: Image.asset(Assets.images.contact.email),
            ),
            Row(
              spacing: 10,
              mainAxisAlignment: .center,
              children: <Widget>[
                Text(
                  config.contactEmail,
                  style: theme.typography.subH1Regular.copyWith(
                    fontSize: switch (context.screenSize) {
                      .extraLarge => 32,
                      .large => 24,
                      .normal || .small => 16,
                    },
                  ),
                ),
                InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () async {
                    await Clipboard.setData(
                      ClipboardData(text: config.contactEmail),
                    );
                  },
                  child: SizedBox.square(
                    dimension: switch (context.screenSize) {
                      .extraLarge || .large => 32,
                      .normal || .small => 24,
                    },
                    child: SvgPicture.asset(
                      Assets.images.icons.copy,
                      semanticsLabel: l10n.contactCopyEmail,
                    ),
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

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/features/privacy_terms/presentation/view_model/privacy_terms_view_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';

class TermsMain extends ConsumerWidget {
  const TermsMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final privacyPolicyData = ref.watch(
      privacyPolicyProvider(Locale(l10n.localeName)),
    );

    return privacyPolicyData.maybeWhen(
      data: (data) {
        final theme = context.theme.fclThemeScheme;
        final bodyTextStyle = switch (context.screenSize) {
          ScreenSize.extraLarge ||
          ScreenSize.large => theme.typography.body1Regular.copyWith(
            color: theme.colorScheme.inverseNeutral,
          ),
          ScreenSize.normal ||
          ScreenSize.small => theme.typography.body3Regular.copyWith(
            color: theme.colorScheme.inverseNeutral,
          ),
        };

        return ColoredBox(
          color: theme.colorScheme.neutral,
          child: SectionContainer(
            spacing: 30,
            children: <Widget>[
              MarkdownWidget(
                data: data,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                config: MarkdownConfig(
                  configs: [
                    H1Config(
                      style: theme.typography.h1Bold.copyWith(
                        color: theme.colorScheme.inverseNeutral,
                      ),
                    ),
                    H2Config(
                      style: theme.typography.h2Bold.copyWith(
                        color: theme.colorScheme.inverseNeutral,
                      ),
                    ),
                    H3Config(
                      style: theme.typography.h3Bold.copyWith(
                        color: theme.colorScheme.inverseNeutral,
                      ),
                    ),
                    H4Config(
                      style: theme.typography.h4Bold.copyWith(
                        color: theme.colorScheme.inverseNeutral,
                      ),
                    ),
                    H5Config(
                      style: theme.typography.h4Bold.copyWith(
                        fontSize: 20,
                        color: theme.colorScheme.inverseNeutral,
                      ),
                    ),
                    H6Config(
                      style: theme.typography.h4Bold.copyWith(
                        fontSize: 18,
                        color: theme.colorScheme.inverseNeutral,
                      ),
                    ),
                    PConfig(textStyle: bodyTextStyle),
                    LinkConfig(
                      style: bodyTextStyle.copyWith(
                        color: FlutterLatamColors.mediumBlue,
                        decoration: TextDecoration.underline,
                        decorationColor: FlutterLatamColors.mediumBlue,
                      ),
                      onTap: Utils.launchUrlLink,
                    ),
                    ListConfig(
                      marker: (_, _, _) => Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: SizedBox.square(
                          dimension: 6,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.colorScheme.neutral,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      orElse: Offstage.new,
    );
  }
}

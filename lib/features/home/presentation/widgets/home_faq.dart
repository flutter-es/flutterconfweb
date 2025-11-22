import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/icons/circle_icon.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/features/home/domain/models/faq/faq_model.dart';
import 'package:flutter_conf_latam/features/home/presentation/view_model/home_view_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/theme.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeFaq extends ConsumerWidget {
  const HomeFaq({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final faqList = ref.watch(faqListProvider(Locale(l10n.localeName)));

    return faqList.maybeWhen(
      data: (data) {
        return SectionContainer(
          spacing: 30,
          children: <Widget>[
            TitleSubtitleText(
              title: (
                text: l10n.homeFaqTitle,
                size: switch (context.screenSize) {
                  .extraLarge => 64,
                  .large => 48,
                  .normal || .small => 24,
                },
              ),
              subtitle: (
                text: l10n.homeFaqDescription,
                size: switch (context.screenSize) {
                  .extraLarge || .large => 24,
                  .normal || .small => 16,
                },
              ),
              spacing: 12,
            ),
            ResponsiveGrid(
              columnSizes: switch (context.screenSize) {
                .extraLarge => 2,
                _ => 1,
              },
              rowSizes: switch (context.screenSize) {
                .extraLarge => 2,
                _ => data.length,
              },
              children: <Widget>[
                for (final item in data) _FaqCardItem(item: item),
              ],
            ),
          ],
        );
      },
      orElse: Offstage.new,
    );
  }
}

class _FaqCardItem extends HookWidget {
  const _FaqCardItem({required this.item});

  final FaqModel item;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.fclThemeScheme;
    final isExpanded = useState(false);

    const iconColor = FlutterLatamColors.white;
    final expandedIcon = switch (isExpanded.value) {
      true => const Icon(Icons.remove, color: iconColor, key: ValueKey(1)),
      false => const Icon(Icons.add, color: iconColor, key: ValueKey(2)),
    };

    return Card(
      clipBehavior: .antiAliasWithSaveLayer,
      color: FlutterLatamColors.darkBlue,
      shape: RoundedRectangleBorder(borderRadius: .circular(20)),
      child: Padding(
        padding: const .all(30),
        child: InkWell(
          mouseCursor: SystemMouseCursors.click,
          onTap: () => isExpanded.value = !isExpanded.value,
          child: Column(
            spacing: 10,
            crossAxisAlignment: .start,
            children: <Widget>[
              Row(
                spacing: 12,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      item.question,
                      style: theme.typography.subH2Semibold,
                    ),
                  ),
                  CircleIcon(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: expandedIcon,
                    ),
                  ),
                ],
              ),
              if (isExpanded.value)
                Text(
                  item.answer,
                  style: theme.typography.subH3Regular,
                ).animate().fade(
                  duration: 2.seconds,
                  curve: Curves.fastOutSlowIn,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

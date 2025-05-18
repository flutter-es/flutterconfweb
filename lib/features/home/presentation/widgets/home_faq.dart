import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef FaqItem = ({String question, String answer});

class HomeFaq extends ConsumerWidget {
  const HomeFaq({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final faqList = List.generate(4, (index) {
      return (
        question: '¿Cuantas entradas de Early Bird están disponibles?',
        answer: 'Tenemos 150 entradas destinadas a Early Bird.',
      );
    });

    return SectionContainer(
      spacing: 30,
      children: <Widget>[
        TitleSubtitleText(
          title: (
            text: l10n.homeFaqTitle,
            size: switch (context.screenSize) {
              ScreenSize.extraLarge => 64,
              ScreenSize.large => 48,
              ScreenSize.normal || ScreenSize.small => 24,
            },
          ),
          subtitle: (
            text: l10n.homeFaqDescription,
            size: switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => 24,
              ScreenSize.normal || ScreenSize.small => 16,
            },
          ),
          spacing: 12,
        ),
        ResponsiveGrid(
          columnSizes: switch (context.screenSize) {
            ScreenSize.extraLarge => 2,
            _ => 1,
          },
          rowSizes: switch (context.screenSize) {
            ScreenSize.extraLarge => 2,
            _ => faqList.length,
          },
          children: <Widget>[
            for (final item in faqList) _FaqCardItem(item: item),
          ],
        ),
      ],
    );
  }
}

class _FaqCardItem extends HookWidget {
  const _FaqCardItem({required this.item});

  final FaqItem item;

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(false);

    const iconColor = FlutterLatamColors.white;
    final expandedIcon = switch (isExpanded.value) {
      true => const Icon(Icons.remove, color: iconColor, key: ValueKey(1)),
      false => const Icon(Icons.add, color: iconColor, key: ValueKey(2)),
    };

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterLatamColors.darkBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: InkWell(
            onTap: () => isExpanded.value = !isExpanded.value,
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  spacing: 12,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        item.question,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: FlutterLatamColors.white,
                        ),
                      ),
                    ),
                    SizedBox.square(
                      dimension: 32,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: FlutterLatamColors.mediumBlue,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: expandedIcon,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (isExpanded.value)
                  Text(
                    item.answer,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: FlutterLatamColors.white,
                    ),
                  ).animate().fade(
                    duration: 2.seconds,
                    curve: Curves.fastOutSlowIn,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

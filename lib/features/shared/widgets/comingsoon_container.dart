import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ComingSoonContainer extends ConsumerWidget {
  const ComingSoonContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = ref.watch(appLocalizationsProvider);

    final double comingSoonFontSize = getValueForScreenType(
      context: context,
      mobile: 20,
      tablet: 20,
      desktop: 30,
    );

    final double comingSoonIconSize = getValueForScreenType(
      context: context,
      mobile: 40,
      tablet: 40,
      desktop: 40,
    );

    final EdgeInsets comingSoonPadding = getValueForScreenType(
      context: context,
      mobile: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      tablet: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      desktop: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 40,
      ),
    );

    return Container(
      padding: comingSoonPadding,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.construction,
              color: Colors.black, size: comingSoonIconSize),
          const SizedBox(width: 20),
          Text(appLoc.comingSoon,
              style: TextStyle(
                  fontSize: comingSoonFontSize, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

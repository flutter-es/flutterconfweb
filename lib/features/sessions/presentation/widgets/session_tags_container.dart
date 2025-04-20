import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionTagsContainer extends ConsumerWidget {
  const SessionTagsContainer({required this.tags, super.key});

  final List<String> tags;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = ref.watch(appLocalizationsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: FlutterConfLatamStyles.smallSize,
          ),
          child: Text(appLoc.sessionTags, style: FlutterConfLatamStyles.h7),
        ),
        FlutterConfLatamStyles.smallVGap,

        if (tags.isNotEmpty)
          Wrap(
            children: List.generate(tags.length, (index) {
              return tags[index].isNotEmpty
                  ? Container(
                    padding: FlutterConfLatamStyles.xSmallPadding.copyWith(
                      left: FlutterConfLatamStyles.mediumSize,
                      right: FlutterConfLatamStyles.mediumSize,
                    ),
                    margin: const EdgeInsets.only(
                      bottom: FlutterConfLatamStyles.smallSize,
                      right: FlutterConfLatamStyles.smallSize,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(
                        FlutterConfLatamStyles.smallRadius,
                      ),
                    ),
                    child: Text(
                      tags[index],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                  : const SizedBox.shrink();
            }),
          ),
      ],
    );
  }
}

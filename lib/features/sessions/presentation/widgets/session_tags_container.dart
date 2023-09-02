import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionTagsContainer extends ConsumerWidget {

  final List<String> tags;
  const SessionTagsContainer({
    required this.tags,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appLoc = ref.watch(appLocalizationsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: FlutterConfLatamStyles.smallSize),
          child: Text(appLoc.sessionTags, style: FlutterConfLatamStyles.h7),
        ),
        FlutterConfLatamStyles.smallVGap,
        Wrap(
          children: List.generate(
            tags.length, (index) {
              return Container(
                padding: FlutterConfLatamStyles.xsmallPadding.copyWith(
                  left: FlutterConfLatamStyles.mediumSize, right: FlutterConfLatamStyles.mediumSize,
                ),
                margin: const EdgeInsets.only(
                  bottom: FlutterConfLatamStyles.smallSize,
                  right: FlutterConfLatamStyles.smallSize,
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(FlutterConfLatamStyles.smallRadius),
                ),
                child: Text(tags[index], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              );
            }),
        ),
      ],
    );
  }
}

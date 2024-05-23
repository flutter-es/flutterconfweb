import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/communities/presentation/responsiveness/communities_banner.config.dart';
import 'package:flutter_conf_colombia/features/communities/presentation/widgets/communities_list.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunitiesContainer extends ConsumerWidget {
  const CommunitiesContainer({super.key});
  static const title = 'speakers_container';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = ref.watch(appLocalizationsProvider);
    final config =
        CommunitiesBannerResonsiveConfig.getCommunitiesBannerConfig(context);

    return Container(
      margin: config.bannerMargin,
      padding: config.bannerPadding,
      alignment: Alignment.center,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Text(
            appLoc.communitiesTitle,
            textAlign: TextAlign.center,
            style: config.titleStyle,
          ),
          Container(
            padding: FlutterConfLatamStyles.bannerPadding,
            child: Text(
              appLoc.communitiesSubtitle,
              textAlign: TextAlign.center,
              style: config.subTitleStyle,
            ),
          ),
          FlutterConfLatamStyles.mediumVGap,
          const CommunitiesList(),
        ],
      ),
    );
  }
}

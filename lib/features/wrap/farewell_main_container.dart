import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/animations/flutter_dash_animations.dart';
import 'package:flutter_conf_colombia/features/wrap/farewell_page.config.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FarewellMainContainer extends ConsumerWidget {
  const FarewellMainContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final config = FarewellPageResponsiveConfig.getFarewellPageConfig(context);
    final appLoc = ref.watch(appLocalizationsProvider);
    final farewellHeight = config.bannerHeight;

    return Container(
        height: farewellHeight,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              bottom: config.dashBottomOffset,
              right: 0,
              top: 0,
              left: 0,
              child: Align(
                alignment: config.dashAlignment,
                child: SizedBox(
                  width: config.dashSize,
                  height: config.dashSize,
                  child: const FlutterDashAnimation(
                    animation: FlutterDashAnimations.flutterdashflag,
                  ),
                ),
              ),
            ),
            Align(
              alignment: config.contentAlignment,
              child: Container(
                margin: config.bannerMargin,
                width: config.contentWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: config.columnAlignment,
                  children: [
                    Text(
                      appLoc.wrapTitle,
                      textAlign: config.textAlign,
                      style: config.titleStyle,
                    ),
                    Text(
                      appLoc.wrapSubtitle,
                      textAlign: config.textAlign,
                      style: config.subtitleStyle,
                    ),
                    Text(
                      appLoc.wrapContent1,
                      textAlign: config.textAlign,
                      style: config.content1Style,
                    ),
                    config.textGap,
                    Text(
                      appLoc.wrapContent2,
                      textAlign: config.textAlign,
                      style: config.content2Style
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
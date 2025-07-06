import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/enums/enums.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/routes/app_route_path.dart';
import 'package:flutter_conf_latam/core/widgets/animations/flutter_rive_animated.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorPage extends ConsumerWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox.square(
              dimension: switch (context.screenSize) {
                ScreenSize.extraLarge => 400,
                ScreenSize.large => 300,
                _ => 250,
              },
              child: FlutterRiveAnimated(
                path: Assets.animations.flutterWarning,
                animation: FlutterConfAnimations.flutterWarning,
              ),
            ),
            Text(
              l10n.errorPageTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: FlutterLatamColors.grey,
                fontSize: switch (context.screenSize) {
                  ScreenSize.extraLarge => 60,
                  ScreenSize.large => 50,
                  _ => 40,
                },
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              l10n.errorPageSubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: FlutterLatamColors.grey,
                fontSize: switch (context.screenSize) {
                  ScreenSize.extraLarge => 30,
                  _ => 20,
                },
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: const StadiumBorder(),
                backgroundColor: FlutterLatamColors.darkBlue,
                foregroundColor: FlutterLatamColors.white,
              ),
              onPressed: () => context.go('/${AppRoutePath.home.pathName}'),
              child: Padding(
                padding: FlutterConfLatamStyles.mediumPadding,
                child: Text(l10n.errorReturnHomeButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/enums/enums.dart';
import 'package:flutter_conf_latam/core/widgets/animations/flutter_rive_animated.dart';
import 'package:flutter_conf_latam/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';

part '../responsiveness/error_page_responsive.dart';

class ErrorPage extends ConsumerWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final responsiveConfig = _responsiveConfig(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox.square(
              dimension: responsiveConfig.dashDimensions,
              child: const FlutterRiveAnimated(
                path: './assets/animations/flutter_warning.riv',
                animation: FlutterConfAnimations.flutterWarning,
              ),
            ),
            Text(
              l10n.errorPageTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: responsiveConfig.titleSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              l10n.errorPageSubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: responsiveConfig.subtitleSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            FlutterConfLatamStyles.mediumVGap,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: const StadiumBorder(),
                backgroundColor: FlutterLatamColors.darkBlue,
                foregroundColor: FlutterLatamColors.white,
              ),
              onPressed: () => context.go(HomePage.route),
              child: Padding(
                padding: FlutterConfLatamStyles.mediumPadding,
                child: Text(l10n.errorReturHomeButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

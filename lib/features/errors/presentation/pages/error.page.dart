import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/errors/presentation/responsiveness/errorpage_responsive.config.dart';
import 'package:flutter_conf_colombia/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_colombia/features/shared/widgets/animations/flutter_warning.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/styles/colors.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends ConsumerWidget {
  const ErrorPage({
    required this.errorMessage,
    super.key,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = ref.watch(appLocalizationsProvider);
    final uiConfig = ErrorPageResponsiveConfig.getSponsorsBannerConfig(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: uiConfig.dashDimensions,
              height: uiConfig.dashDimensions,
              child: const FlutterWarningAnimated(),
            ),
            Text(
              appLoc.errorPageTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: uiConfig.titleSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              appLoc.errorPageSubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: uiConfig.subtitleSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: uiConfig.textContainerWidth,
              child: Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            FlutterConfLatamStyles.mediumVGap,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                elevation: 0,
                backgroundColor: FlutterLatamColors.darkBlue,
              ),
              onPressed: () {
                GoRouter.of(context).go(HomePage.route);
              },
              child: Padding(
                padding: FlutterConfLatamStyles.mediumPadding,
                child: Text(appLoc.errorReturHomeButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

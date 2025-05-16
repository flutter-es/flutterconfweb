import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/routes/app_routes_pages.dart';
import 'package:flutter_conf_latam/core/widgets/navigation/shell_navigator_page.dart';
import 'package:flutter_conf_latam/features/contact/presentation/pages/contact_page.dart';
import 'package:flutter_conf_latam/features/errors/presentation/pages/error_page.dart';
import 'package:flutter_conf_latam/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_latam/features/splash/presentation/pages/splash.page.dart';
import 'package:go_router/go_router.dart';

final _mainRoutesKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _tabRoutesKeys = GlobalKey<NavigatorState>(debugLabel: 'tabShell');

class AppRoutes {
  AppRoutes()
    : _router = GoRouter(
        initialLocation: SplashPage.route,
        routerNeglect: true,
        navigatorKey: _mainRoutesKey,
        routes: <RouteBase>[
          GoRoute(
            path: SplashPage.route,
            parentNavigatorKey: _mainRoutesKey,
            pageBuilder: (_, state) {
              return ScreenPage(key: state.pageKey, child: const SplashPage());
            },
          ),
          ShellRoute(
            navigatorKey: _tabRoutesKeys,
            builder: (_, __, child) => ShellNavigatorPage(child: child),
            routes: <RouteBase>[
              GoRoute(
                path: HomePage.route,
                parentNavigatorKey: _tabRoutesKeys,
                pageBuilder: (_, __) {
                  return const NoTransitionPage(child: HomePage());
                },
              ),
              GoRoute(
                path: ContactPage.route,
                parentNavigatorKey: _tabRoutesKeys,
                pageBuilder: (_, __) {
                  return const NoTransitionPage(child: ContactPage());
                },
              ),
            ],
          ),
        ],
        errorPageBuilder: (_, __) {
          return const NoTransitionPage(child: ErrorPage());
        },
        debugLogDiagnostics: kDebugMode,
      );

  final GoRouter _router;

  GoRouter get router => _router;
}

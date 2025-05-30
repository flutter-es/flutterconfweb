import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/routes/app_route_path.dart';
import 'package:flutter_conf_latam/core/routes/app_routes_pages.dart';
import 'package:flutter_conf_latam/core/widgets/navigation/shell_navigator_page.dart';
import 'package:flutter_conf_latam/features/contact/presentation/pages/contact_page.dart';
import 'package:flutter_conf_latam/features/errors/presentation/pages/error_page.dart';
import 'package:flutter_conf_latam/features/gallery/presentation/pages/gallery_page.dart';
import 'package:flutter_conf_latam/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_latam/features/splash/presentation/pages/splash.page.dart';
import 'package:flutter_conf_latam/features/venue/presentation/pages/venue_page.dart';
import 'package:go_router/go_router.dart';

final _mainRoutesKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _tabRoutesKeys = GlobalKey<NavigatorState>(debugLabel: 'tabShell');

class AppRoutes {
  AppRoutes()
    : _router = GoRouter(
        initialLocation: '/${AppRoutePath.splash.pathName}',
        routerNeglect: true,
        navigatorKey: _mainRoutesKey,
        routes: <RouteBase>[
          GoRoute(
            path: '/${AppRoutePath.splash.pathName}',
            parentNavigatorKey: _mainRoutesKey,
            pageBuilder: (_, state) {
              return ScreenPage(key: state.pageKey, child: const SplashPage());
            },
          ),
          ShellRoute(
            navigatorKey: _tabRoutesKeys,
            builder: (_, _, child) => ShellNavigatorPage(child: child),
            routes: <RouteBase>[
              GoRoute(
                path: '/${AppRoutePath.home.pathName}',
                parentNavigatorKey: _tabRoutesKeys,
                pageBuilder: (_, _) {
                  return const NoTransitionPage(child: HomePage());
                },
              ),
              GoRoute(
                path: '/${AppRoutePath.venue.pathName}',
                parentNavigatorKey: _tabRoutesKeys,
                pageBuilder: (_, _) {
                  return const NoTransitionPage(child: VenuePage());
                },
              ),
              GoRoute(
                path: '/${AppRoutePath.gallery.pathName}',
                parentNavigatorKey: _tabRoutesKeys,
                pageBuilder: (_, _) {
                  return const NoTransitionPage(child: GalleryPage());
                },
              ),
              GoRoute(
                path: '/${AppRoutePath.contact.pathName}',
                parentNavigatorKey: _tabRoutesKeys,
                pageBuilder: (_, _) {
                  return const NoTransitionPage(child: ContactPage());
                },
              ),
            ],
          ),
        ],
        errorPageBuilder: (_, _) {
          return const NoTransitionPage(child: ErrorPage());
        },
        debugLogDiagnostics: kDebugMode,
      );

  final GoRouter _router;

  GoRouter get router => _router;
}

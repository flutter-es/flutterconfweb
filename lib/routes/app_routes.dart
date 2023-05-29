import 'package:flutter_conf_colombia/features/cfp/presentation/pages/cfp_page.dart';
import 'package:flutter_conf_colombia/features/errors/presentation/error.page.dart';
import 'package:flutter_conf_colombia/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_colombia/features/shellpage/shell.page.dart';
import 'package:flutter_conf_colombia/features/splash/presentation/pages/splash.page.dart';
import 'package:flutter_conf_colombia/features/tickets/presentation/pages/tickets_page.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {

  static final router = GoRouter(
    routerNeglect: true,
    initialLocation: SplashPage.route,
    navigatorKey: Utils.mainNav,

    routes: [
      GoRoute(
        parentNavigatorKey: Utils.mainNav,
        path: SplashPage.route,
        builder: (context, state) {
            return const SplashPage();
        },
      ),
      ShellRoute(
        navigatorKey: Utils.tabNav,
        builder: (context, state, child) {
          return ShellPage(child: child);
        },
        routes: [
          GoRoute(
            parentNavigatorKey: Utils.tabNav,
            path: HomePage.route,
            pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: HomePage(),
                );
            },
          ),
          GoRoute(
            parentNavigatorKey: Utils.tabNav,
            path: CFPPage.route,
            pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: CFPPage(),
                );
            },
          ),
          GoRoute(
            parentNavigatorKey: Utils.tabNav,
            path: TicketsPage.route,
            pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: TicketsPage(),
                );
            },
          ),
        ]
      ),
    ],
    errorPageBuilder: (context, state) {
      return NoTransitionPage(
        child: ErrorPage(errorMessage: state.error.toString())
      );
    }
  );
}
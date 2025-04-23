import 'package:flutter_conf_latam/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_latam/features/navigation/data/models/tab_navigation_item.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationRepository {
  const NavigationRepository(this.ref);

  final Ref ref;

  List<TabNavigationItem> getNavigation() {
    final appLoc = ref.watch(appLocalizationsProvider);

    return [
      TabNavigationItem(
        label: appLoc.home,
        route: HomePage.route,
        isSelected: true,
        display: false,
      ),
    ];
  }
}

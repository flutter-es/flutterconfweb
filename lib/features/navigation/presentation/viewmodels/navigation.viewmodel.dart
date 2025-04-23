import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/features/navigation/data/models/tab_navigation_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationViewModel extends StateNotifier<List<TabNavigationItem>> {
  NavigationViewModel(List<TabNavigationItem> items, this.ref) : super([]) {
    state = items;
  }

  final Ref ref;

  void init() {
    final selectedNavRoute = ref.read(webLocalStorageProvider).getSelectedNav();

    if (selectedNavRoute.isNotEmpty) {
      final item = state.where((i) => i.route == selectedNavRoute).first;
      selectNavItem(item);
    } else {
      selectNavItem(state.first);
    }
  }

  void selectNavItem(TabNavigationItem item) {
    state = [
      for (final element in state)
        element.copyWith(isSelected: item == element),
    ];
    ref.read(webLocalStorageProvider).storeSelectedNav(item.route);
  }

  void selectNavItemFromRoute(String route) {
    final routeItem = state.where((i) => i.route == route).first;
    selectNavItem(routeItem);
  }
}

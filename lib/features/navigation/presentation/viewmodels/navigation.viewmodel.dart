import 'package:flutter_conf_colombia/features/navigation/data/models/tab_navigation_item.dart';
import 'package:flutter_conf_colombia/features/shared/providers/shared_providers.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NavigationViewModel extends StateNotifier<List<TabNavigationItem>> {

  NavigationViewModel(List<TabNavigationItem> items, this.ref) : super([]) {
    state = items;
  }
  
  final Ref ref;

  void init() {
    var selectedNavRoute = ref.read(webLocalStorageProvider).getSelectedNav();

    if (selectedNavRoute.isNotEmpty) {
      var item = state.where((i) => i.route == selectedNavRoute).first;
      selectNavItem(item);
    }
    else {
      selectNavItem(state.first);
    }
  }

  void selectNavItem(TabNavigationItem item) {
    
    if (item.route.isNotEmpty) {
      GoRouter.of(Utils.tabNav.currentContext!).go(item.route);
    }

    ref.read(webLocalStorageProvider).storeSelectedNav(item.route);

    state = [
      for (var element in state)
       element.copyWith(isSelected: item == element,)
    ];
  }

  void selectNavItemFromRoute(String route) {
    final routeItem = state.where((i) => i.route == route).first;
    selectNavItem(routeItem);
  }
}

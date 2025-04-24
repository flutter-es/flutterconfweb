import 'package:flutter_conf_latam/core/services/web_local_storage_service.dart';
import 'package:flutter_conf_latam/features/navigation/data/models/navigation_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationViewModel extends StateNotifier<List<NavigationItemModel>> {
  NavigationViewModel(this.localStorageService, super.items);

  final WebLocalStorageService localStorageService;

  void init() {
    final selectedNavRoute = localStorageService.getSelectedNav();
    if (selectedNavRoute.isNotEmpty) {
      selectNavItemFromRoute(selectedNavRoute);
    } else {
      selectNavItem(state.first);
    }
  }

  void selectNavItemFromRoute(String route) {
    selectNavItem(
      state.firstWhere(
        (item) => item.route == route,
        orElse: () => state.first,
      ),
    );
  }

  void selectNavItem(NavigationItemModel item) {
    state = [
      for (final element in state)
        element.copyWith(isSelected: item == element),
    ];
    localStorageService.storeSelectedNav(item.route);
  }
}

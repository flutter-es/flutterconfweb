import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/routes/app_route_path.dart';
import 'package:flutter_conf_latam/core/routes/helpers/navigation_item_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationViewModel extends Notifier<List<NavigationItemModel>> {
  @override
  List<NavigationItemModel> build() {
    final l10n = ref.watch(appLocalizationsProvider);
    final navigationItemList = <NavigationItemModel>[
      NavigationItemModel(
        label: '',
        route: '/${AppRoutePath.home.pathName}',
        isSelected: true,
      ),
      NavigationItemModel(
        label: l10n.menuVenueText,
        route: '/${AppRoutePath.venue.pathName}',
      ),
      NavigationItemModel(
        label: l10n.menuContactText,
        route: '/${AppRoutePath.contact.pathName}',
      ),
    ];

    if (_selectedNav.isEmpty) return navigationItemList;
    return navigationItemList.map((item) {
      if (item.route == _selectedNav) return item.copyWith(isSelected: true);
      return item;
    }).toList();
  }

  void init() {
    if (_selectedNav.isNotEmpty) {
      selectNavItemFromRoute(_selectedNav);
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
    ref.read(webLocalStorageProvider).storeSelectedNav(item.route);
  }

  String get _selectedNav => ref.read(webLocalStorageProvider).getSelectedNav();
}

final navigationViewModelProvider =
    NotifierProvider<NavigationViewModel, List<NavigationItemModel>>(
      NavigationViewModel.new,
    );

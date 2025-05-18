import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/routes/app_route_path.dart';
import 'package:flutter_conf_latam/core/routes/helpers/navigation_item_model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationViewModel extends Notifier<List<NavigationItemModel>> {
  @override
  List<NavigationItemModel> build() {
    final l10n = ref.watch(appLocalizationsProvider);
    return <NavigationItemModel>[
      NavigationItemModel(
        label: '',
        route: '/${AppRoutePath.home.pathName}',
        isSelected: true,
        display: false,
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
  }

  void init() {
    final selectedNavRoute = ref.read(webLocalStorageProvider).getSelectedNav();
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
    ref.read(webLocalStorageProvider).storeSelectedNav(item.route);
  }
}

final navigationViewModelProvider =
    NotifierProvider<NavigationViewModel, List<NavigationItemModel>>(
      NavigationViewModel.new,
    );

import 'package:collection/collection.dart';
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
        label: l10n.menuAboutText,
        subMenus: <SubNavigationItemModel>[
          SubNavigationItemModel(
            label: l10n.menuVenueText,
            route: '/${AppRoutePath.venue.pathName}',
          ),
          SubNavigationItemModel(
            label: l10n.menuOrganizersText,
            route: '/${AppRoutePath.organizers.pathName}',
          ),
        ],
      ),
      NavigationItemModel(
        label: l10n.menuGalleryText,
        route: '/${AppRoutePath.gallery.pathName}',
      ),
      NavigationItemModel(
        label: l10n.menuScheduleText,
        route: '/${AppRoutePath.schedule.pathName}',
      ),
      NavigationItemModel(
        label: l10n.menuContactText,
        route: '/${AppRoutePath.contact.pathName}',
      ),
    ];

    if (_selectedNav.isEmpty) return navigationItemList;
    return navigationItemList.map((item) {
      if (item.route != null) {
        if (item.route == _selectedNav) return item.copyWith(isSelected: true);
      } else if (item.subMenus != null) {
        final subMenu = item.subMenus!.firstWhereOrNull(
          (item) => item.route == _selectedNav,
        );
        if (subMenu != null) {
          final newSubmenu = subMenu.copyWith(isSelected: true);
          final index = item.subMenus!.indexOf(subMenu);

          final newSubmenus = [...item.subMenus!]
            ..removeAt(index)
            ..insert(index, newSubmenu);

          return item.copyWith(isSelected: true, subMenus: newSubmenus);
        }
      }
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
      state.firstWhere((item) {
        if (item.route != null) {
          return item.route == route;
        } else if (item.subMenus != null) {
          return item.subMenus!.where((item) => item.route == route).isNotEmpty;
        }
        return false;
      }, orElse: () => state.first),
    );
  }

  void selectNavItem(NavigationItemModel item) {
    state = [
      for (final element in state)
        element.copyWith(
          isSelected: item.route == element.route,
          subMenus: item.route != element.route
              ? item.subMenus?.map((item) {
                  return item.copyWith(isSelected: false);
                }).toList()
              : item.subMenus,
        ),
    ];

    final currentRoute =
        item.route ??
        item.subMenus?.firstWhereOrNull((item) => item.isSelected)?.route;

    if (currentRoute == null) return;
    ref.read(webLocalStorageProvider).storeSelectedNav(currentRoute);
  }

  String get _selectedNav => ref.read(webLocalStorageProvider).getSelectedNav();
}

final navigationViewModelProvider =
    NotifierProvider<NavigationViewModel, List<NavigationItemModel>>(
      NavigationViewModel.new,
    );

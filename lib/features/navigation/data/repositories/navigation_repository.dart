import 'package:flutter_conf_latam/features/home/presentation/pages/home_page.dart';
import 'package:flutter_conf_latam/features/navigation/data/models/navigation_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationRepository {
  const NavigationRepository(this.ref);

  final Ref ref;

  List<NavigationItemModel> getNavigation() {
    // final appLoc = ref.watch(appLocalizationsProvider);

    return <NavigationItemModel>[
      const NavigationItemModel(
        label: '',
        route: HomePage.route,
        isSelected: true,
        display: false,
      ),
    ];
  }
}

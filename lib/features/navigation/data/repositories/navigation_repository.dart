import 'package:flutter_conf_latam/core/routes/app_route_path.dart';
import 'package:flutter_conf_latam/features/navigation/data/models/navigation_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationRepository {
  const NavigationRepository(this.ref);

  final Ref ref;

  List<NavigationItemModel> getNavigation() {
    // final appLoc = ref.watch(appLocalizationsProvider);

    return <NavigationItemModel>[
      NavigationItemModel(
        label: '',
        route: '/${AppRoutePath.home.pathName}',
        isSelected: true,
        display: false,
      ),
    ];
  }
}

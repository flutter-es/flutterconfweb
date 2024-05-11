import 'package:flutter_conf_colombia/features/home/data/models/home_container.model.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeContainerRepository {
  const HomeContainerRepository(this.ref);

  final Ref ref;

  HomeContainerModel getHomeContainerContent() {
    final appLoc = ref.watch(appLocalizationsProvider);

    return HomeContainerModel(
      title: appLoc.homeContainerMainTitle,
      content: appLoc.homeContainerSubtitle,
      buttonLabel: appLoc.cfpOpen,
      dateLabel: appLoc.homeContainerDateLabel,
      countryLabel: appLoc.homeContainerCountryLabel,
      cfpUrlLink: 'https://forms.gle/oQPB3g7Ln7GTcpdq6',
    );
  }
}

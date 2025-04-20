import 'package:flutter_conf_latam/features/home/data/models/datelocation.model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateLocationRepository {
  DateLocationRepository(this.ref);

  final Ref ref;

  DateLocationModel getDateLocationContainerContent() {
    final appLoc = ref.watch(appLocalizationsProvider);

    return DateLocationModel(
      date: appLoc.conferenceDate,
      location: appLoc.conferenceLocation,
      address: appLoc.conferenceAddress,
    );
  }
}

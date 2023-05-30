import 'package:flutter_conf_colombia/features/home/data/models/datelocation.model.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateLocationRepository {

  final Ref ref;

  DateLocationRepository(this.ref);

  DateLocationModel getDateLocationContainerContent() {
    final appLoc = ref.watch(appLocalizationsProvider);

    return DateLocationModel(
      date: appLoc.conferenceDate,
      location: appLoc.conferenceLocation,
      address: appLoc.conferenceAddress
    );
  }
}
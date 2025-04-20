import 'package:flutter_conf_latam/features/home/data/models/event_feature.model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventFeatureRepository {
  const EventFeatureRepository(this.ref);

  final Ref ref;

  List<EventFeatureModel> getEventFeatures() {
    final appLocalizations = ref.watch(appLocalizationsProvider);

    return [
      EventFeatureModel(
        icon: FlutterConfLatamIcons.flutter,
        description: appLocalizations.eventFeature1,
      ),
      EventFeatureModel(
        icon: FlutterConfLatamIcons.tracks,
        description: appLocalizations.eventFeature2,
      ),
      EventFeatureModel(
        icon: FlutterConfLatamIcons.speaker,
        description: appLocalizations.eventFeature3,
      ),
    ];
  }
}

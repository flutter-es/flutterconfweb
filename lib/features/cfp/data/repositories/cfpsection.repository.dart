import 'package:flutter_conf_colombia/features/cfp/data/models/cfpsection.model.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CFPSectionRepository {
  CFPSectionRepository(this.ref);

  final Ref ref;

  CFPSectionModel getCFPSectionData() {
    final appLoc = ref.watch(appLocalizationsProvider);
    return CFPSectionModel(
      cfpSubmitLabel: appLoc.submitYourTalk,
      cfpButtonLabel: appLoc.cfpOpen,
      cfpUrlLink:
          'https://docs.google.com/forms/d/e/1FAIpQLSd9DRutDGzKcKUcwLh103oRIBQw3cppEqBYAR5IfAmbAage9g/viewform',
    );
  }
}

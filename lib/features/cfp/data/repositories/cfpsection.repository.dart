import 'package:flutter_conf_latam/features/cfp/data/models/cfpsection.model.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CFPSectionRepository {
  CFPSectionRepository(this.ref);

  final Ref ref;

  CFPSectionModel getCFPSectionData() {
    final appLoc = ref.watch(appLocalizationsProvider);
    return CFPSectionModel(
      cfpSubmitLabel: appLoc.submitYourTalk,
      cfpButtonLabel: appLoc.cfpOpen,
      cfpUrlLink: 'https://forms.gle/oQPB3g7Ln7GTcpdq6',
    );
  }
}

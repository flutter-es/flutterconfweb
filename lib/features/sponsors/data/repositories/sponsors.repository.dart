import 'dart:async';
import 'package:flutter_conf_colombia/features/shared/providers/shared_providers.dart';
import 'package:flutter_conf_colombia/features/sponsors/data/models/sponsor.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SponsorsRepository {

  const SponsorsRepository(this.ref);

  final Ref ref;

  Future<List<SponsorModel>> getSponsors() {

    Completer<List<SponsorModel>> sponsorsCompleter = Completer();

    final dbInstance = ref.read(dbProvider);
    dbInstance.collection('sponsors').get().then((snapshot) async {
        final sponsorsList = snapshot.docs.map((level) => 
          SponsorModel.fromFirestore(level.data())
        ).toList();

      sponsorsCompleter.complete(sponsorsList);

    }).catchError((error) {
      sponsorsCompleter.completeError(error.toString());
    }).onError((error, stackTrace) {
      sponsorsCompleter.completeError(error.toString());
    });

    return sponsorsCompleter.future;
  }
}

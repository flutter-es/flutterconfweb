import 'dart:async';
import 'package:flutter_conf_latam/features/shared/providers/shared_providers.dart';
import 'package:flutter_conf_latam/features/sponsors/data/models/sponsor.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SponsorsRepository {
  const SponsorsRepository(this.ref);

  final Ref ref;

  Future<List<SponsorModel>> getSponsors() {
    final sponsorsCompleter = Completer<List<SponsorModel>>();

    final dbInstance = ref.read(dbProvider);
    dbInstance
        .collection('sponsors')
        .get()
        .then((snapshot) async {
          final sponsorsList =
              snapshot.docs
                  .map((level) => SponsorModel.fromFirestore(level.data()))
                  .toList();

          sponsorsCompleter.complete(sponsorsList);
        })
        .catchError((dynamic error) {
          sponsorsCompleter.completeError(error.toString());
        })
        .onError((error, stackTrace) {
          sponsorsCompleter.completeError(error.toString());
        });

    return sponsorsCompleter.future;
  }
}

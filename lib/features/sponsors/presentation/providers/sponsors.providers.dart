import 'package:flutter_conf_colombia/features/sponsors/data/models/sponsor.model.dart';
import 'package:flutter_conf_colombia/features/sponsors/data/repositories/sponsors.repository.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sponsorsRepositoryProvider = Provider((ref) {
  return SponsorsRepository(ref);
});

final sponsorsProvider = FutureProvider<List<SponsorModel>>((ref) {
  return ref.read(sponsorsRepositoryProvider).getSponsors();
});

final filterSponsorsProvider = FutureProvider.family((ref, SponsorshipLevels filter) async
{
  final allSponsors = await ref.watch(sponsorsProvider.future);
  return allSponsors.where((s) => s.level == filter).toList();
});

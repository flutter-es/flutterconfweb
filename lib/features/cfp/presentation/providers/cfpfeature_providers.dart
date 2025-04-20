import 'package:flutter_conf_latam/features/cfp/data/repositories/cfpsection.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cfpSectionRepositoryProvider = Provider((ref) {
  return CFPSectionRepository(ref);
});

final cfpSectionProvider = Provider((ref) {
  return ref.watch(cfpSectionRepositoryProvider).getCFPSectionData();
});

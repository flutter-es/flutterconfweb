import 'dart:ui';

import 'package:flutter_conf_latam/features/home/data/home_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final communitiesProvider = FutureProvider((ref) {
  return ref.watch(homeRepositoryProvider).getCommunities();
});

final ticketsProvider = FutureProvider.family((ref, Locale locale) {
  return ref
      .watch(homeRepositoryProvider)
      .getTickets(language: locale.languageCode);
});

final faqListProvider = FutureProvider.family((ref, Locale locale) {
  return ref
      .watch(homeRepositoryProvider)
      .getFaqData(language: locale.languageCode);
});

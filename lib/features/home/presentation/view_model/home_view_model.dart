import 'dart:ui';

import 'package:flutter_conf_latam/features/home/data/home_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sponsorsProvider = FutureProvider((ref) {
  return ref.watch(homeRepositoryProvider).getSponsors();
});

final faqListProvider = FutureProvider.family((ref, Locale locale) {
  return ref
      .watch(homeRepositoryProvider)
      .getFaqData(language: locale.languageCode);
});

final galleryPreviewProvider = FutureProvider.autoDispose((ref) async {
  await Future<void>.delayed(const Duration(seconds: 3));
  return <String>[
    'https://picsum.photos/seed/flutter1/800/600',
    'https://picsum.photos/seed/flutter2/800/600',
    'https://picsum.photos/seed/flutter3/800/600',
    'https://picsum.photos/seed/flutter4/800/600',
    'https://picsum.photos/seed/flutter5/800/600',
    'https://picsum.photos/seed/flutter6/800/600',
    'https://picsum.photos/seed/flutter7/800/600',
    'https://picsum.photos/seed/flutter8/800/600',
  ];
});

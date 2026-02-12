import 'dart:ui';

import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/features/home/data/home_repository.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sponsorsProvider = FutureProvider((ref) {
  return ref.watch(homeRepositoryProvider).getSponsors();
});

final faqListProvider = FutureProvider((ref) {
  final localeName = ref.watch(appLocalizationsProvider).localeName;
  return ref
      .watch(homeRepositoryProvider)
      .getFaqData(language: Locale(localeName).languageCode);
});

final galleryPreviewProvider = FutureProvider.autoDispose((ref) async {
  final storageUrl = ref.watch(configProvider).firebaseStorageUrl;

  await Future<void>.delayed(const Duration(seconds: 3));
  return <String>[
    '$storageUrl/gallery%2F06_IMG_FCL.jpg?alt=media&token=484b5873-fc53-454e-a5a9-79d9424ea6c8',
    '$storageUrl/gallery%2F14_IMG_FCL.jpg?alt=media&token=17dc7496-3f06-47ed-a417-d3f73682485f',
    '$storageUrl/gallery%2F16_IMG_FCL.jpg?alt=media&token=d23bbfbd-5fc8-4a1d-a156-95e7b01a03d9',
    '$storageUrl/gallery%2F10_IMG_FCL.jpg?alt=media&token=429c6612-15a2-4db5-a545-e7c822a3cb1b',
    '$storageUrl/gallery%2F26_IMG_FCL.jpg?alt=media&token=d51ac358-aacd-4ec1-a524-c5f6cd74d05a',
    '$storageUrl/gallery%2F33_IMG_FCL.jpg?alt=media&token=6c024ed1-984d-4873-ae21-4da6dccf8ee1',
    '$storageUrl/gallery%2F34_IMG_FCL.jpg?alt=media&token=0e79a9c1-13d4-4402-925d-e6b13229a738',
    '$storageUrl/gallery%2F15_IMG_FCL.jpg?alt=media&token=a14a0693-7d81-4c09-bc90-3377c2648a51',
  ];
});

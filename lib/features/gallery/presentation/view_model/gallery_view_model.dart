import 'package:flutter_conf_latam/core/providers/shared_providers.dart';
import 'package:flutter_conf_latam/features/gallery/data/gallery_repository.dart';
import 'package:flutter_conf_latam/features/gallery/domain/models/gallery_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final galleryDataProvider = FutureProvider((ref) {
  return ref.watch(galleryRepositoryProvider).getGallery();
});

typedef GalleryInfo = ({List<GalleryModel> galleryList, int totalList});

final galleryProvider = FutureProvider<GalleryInfo>((ref) async {
  final pagination = ref.watch(paginationProvider);

  if (pagination.page != 1) {
    await Future<void>.delayed(const Duration(seconds: 1));
  }
  final list = await ref.watch(galleryDataProvider.future);

  final startIndex = (pagination.page - 1) * pagination.pageSize;
  final endIndex = startIndex + pagination.pageSize;

  if (startIndex >= list.length) {
    return (galleryList: <GalleryModel>[], totalList: 0);
  }
  return (
    galleryList: list.sublist(startIndex, endIndex.clamp(0, list.length)),
    totalList: list.length,
  );
});

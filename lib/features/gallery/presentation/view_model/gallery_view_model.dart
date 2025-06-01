import 'package:flutter_conf_latam/features/gallery/data/gallery_repository.dart';
import 'package:flutter_conf_latam/features/gallery/domain/models/gallery_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final galleryDataProvider = FutureProvider((ref) {
  return ref.watch(galleryRepositoryProvider).getGallery();
});

typedef Pagination = ({int page, int pageSize});

final paginationProvider = StateProvider<Pagination>(
  (_) => (page: 1, pageSize: 9),
);

typedef GalleryInfo = ({List<GalleryModel> galleryList, int totalList});

final galleryProvider = FutureProvider<GalleryInfo>((ref) async {
  final pagination = ref.watch(paginationProvider);
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

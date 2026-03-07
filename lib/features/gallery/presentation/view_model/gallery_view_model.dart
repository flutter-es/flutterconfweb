import 'dart:async';

import 'package:flutter_conf_latam/core/providers/shared_providers.dart';
import 'package:flutter_conf_latam/features/gallery/data/gallery_repository.dart';
import 'package:flutter_conf_latam/features/gallery/domain/models/gallery_model.dart';
import 'package:signals/signals.dart';

final galleryDataSignal = futureSignal<List<GalleryModel>>(() async {
  return galleryRepository.value.getGallery();
});

typedef GalleryInfo = ({List<GalleryModel> galleryList, int totalList});

final gallerySignal = computed<AsyncState<GalleryInfo>>(() {
  final dataState = galleryDataSignal.value;

  return dataState.map(
    data: (list) {
      final pagination = paginationController.value;
      final startIndex = (pagination.page - 1) * pagination.pageSize;
      final endIndex = startIndex + pagination.pageSize;

      if (startIndex >= list.length) {
        return AsyncState.data((galleryList: <GalleryModel>[], totalList: 0));
      }

      return AsyncState.data((
        galleryList: list.sublist(startIndex, endIndex.clamp(0, list.length)),
        totalList: list.length,
      ));
    },
    error: AsyncState<GalleryInfo>.error,
    loading: AsyncState<GalleryInfo>.loading,
  );
});

void reloadGallery() {
  unawaited(galleryDataSignal.reload());
}

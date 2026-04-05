import 'dart:async';

import 'package:flutter_conf_common/flutter_conf_common.dart';
import 'package:flutter_conf_core/flutter_conf_core.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/providers/shared_providers.dart';
import 'package:signals/signals.dart';

final galleryDataSignal = futureSignal<List<GalleryEntity>>(() async {
  final result = await galleryRepository.value.listAllGallery();
  return switch (result) {
    Success(:final data) => data,
    Failure(:final failure) => throw failure,
  };
});

typedef GalleryInfo = ({List<GalleryEntity> galleryList, int totalList});

final gallerySignal = computed<AsyncState<GalleryInfo>>(() {
  final dataState = galleryDataSignal.value;

  return dataState.map(
    data: (list) {
      final pagination = paginationController.value;
      final startIndex = (pagination.page - 1) * pagination.pageSize;
      final endIndex = startIndex + pagination.pageSize;

      if (startIndex >= list.length) {
        return AsyncState.data((galleryList: <GalleryEntity>[], totalList: 0));
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

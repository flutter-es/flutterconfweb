import 'dart:async';

import 'package:flutter_conf_latam/core/providers/shared_providers.dart';
import 'package:flutter_conf_latam/features/organizers/data/organizers_repository.dart';
import 'package:flutter_conf_latam/features/organizers/domain/models/communities/communities_model.dart';
import 'package:flutter_conf_latam/features/organizers/domain/models/organizers/organizers_model.dart';
import 'package:signals/signals.dart';

final organizersDataSignal = futureSignal<List<OrganizersModel>>(() async {
  return organizersRepository.value.getOrganizers();
});

typedef OrganizersInfo = ({List<OrganizersModel> galleryList, int totalList});

final organizersSignal = computed<AsyncState<OrganizersInfo>>(() {
  final dataState = organizersDataSignal.value;

  return dataState.map(
    data: (list) {
      final pagination = paginationController.value;
      final startIndex = (pagination.page - 1) * pagination.pageSize;
      final endIndex = startIndex + pagination.pageSize;

      if (startIndex >= list.length) {
        return AsyncState.data(
          (galleryList: <OrganizersModel>[], totalList: 0),
        );
      }

      return AsyncState.data((
        galleryList: list.sublist(startIndex, endIndex.clamp(0, list.length)),
        totalList: list.length,
      ));
    },
    error: AsyncState<OrganizersInfo>.error,
    loading: AsyncState<OrganizersInfo>.loading,
  );
});

final communitiesSignal = futureSignal<List<CommunitiesModel>>(() async {
  return organizersRepository.value.getCommunities();
});

void reloadOrganizers() {
  unawaited(organizersDataSignal.reload());
  unawaited(communitiesSignal.reload());
}

import 'dart:async';

import 'package:flutter_conf_common/flutter_conf_common.dart';
import 'package:flutter_conf_core/flutter_conf_core.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/providers/shared_providers.dart';
import 'package:signals/signals.dart';

final organizersDataSignal = futureSignal<List<OrganizerEntity>>(() async {
  final result = await organizerRepository.value.listAllOrganizers();
  return switch (result) {
    Success(:final data) => data,
    Failure(:final failure) => throw failure,
  };
});

typedef OrganizersInfo = ({List<OrganizerEntity> organizerList, int totalList});

final organizersSignal = computed<AsyncState<OrganizersInfo>>(() {
  final dataState = organizersDataSignal.value;

  return dataState.map(
    data: (list) {
      final pagination = paginationController.value;
      final startIndex = (pagination.page - 1) * pagination.pageSize;
      final endIndex = startIndex + pagination.pageSize;

      if (startIndex >= list.length) {
        return AsyncState.data(
          (organizerList: <OrganizerEntity>[], totalList: 0),
        );
      }

      return AsyncState.data((
        organizerList: list.sublist(startIndex, endIndex.clamp(0, list.length)),
        totalList: list.length,
      ));
    },
    error: AsyncState<OrganizersInfo>.error,
    loading: AsyncState<OrganizersInfo>.loading,
  );
});

final communitiesSignal = futureSignal<List<CommunityEntity>>(() async {
  final result = await communityRepository.value.listActiveCommunities();
  return switch (result) {
    Success(:final data) => data,
    Failure(:final failure) => throw failure,
  };
});

void reloadOrganizers() {
  unawaited(organizersDataSignal.reload());
  unawaited(communitiesSignal.reload());
}

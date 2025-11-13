import 'package:flutter_conf_latam/core/providers/shared_providers.dart';
import 'package:flutter_conf_latam/features/organizers/data/organizers_repository.dart';
import 'package:flutter_conf_latam/features/organizers/domain/models/organizers/organizers_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final organizersDataProvider = FutureProvider((ref) {
  return ref.watch(organizersRepositoryProvider).getOrganizers();
});

typedef OrganizersInfo = ({List<OrganizersModel> galleryList, int totalList});

final organizersProvider = FutureProvider<OrganizersInfo>((ref) async {
  final pagination = ref.watch(paginationProvider);

  if (pagination.page != 1) {
    await Future<void>.delayed(const Duration(seconds: 1));
  }
  final list = await ref.watch(organizersDataProvider.future);

  final startIndex = (pagination.page - 1) * pagination.pageSize;
  final endIndex = startIndex + pagination.pageSize;

  if (startIndex >= list.length) {
    return (galleryList: <OrganizersModel>[], totalList: 0);
  }
  return (
    galleryList: list.sublist(startIndex, endIndex.clamp(0, list.length)),
    totalList: list.length,
  );
});

final communitiesProvider = FutureProvider((ref) {
  return ref.watch(organizersRepositoryProvider).getCommunities();
});

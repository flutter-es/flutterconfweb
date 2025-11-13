import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef Pagination = ({int page, int pageSize});

final paginationProvider = StateProvider.autoDispose<Pagination>(
  (_) => (page: 1, pageSize: 9),
);

import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef Pagination = ({int page, int pageSize});

class PaginationNotifier extends Notifier<Pagination> {
  @override
  Pagination build() => (page: 1, pageSize: 9);

  void update({int? page, int? pageSize}) {
    final currentState = state;
    state = (
      page: page ?? state.page,
      pageSize: pageSize ?? currentState.pageSize,
    );
  }
}

final paginationProvider = NotifierProvider.autoDispose(PaginationNotifier.new);

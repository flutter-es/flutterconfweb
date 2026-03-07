import 'package:signals/signals.dart';

typedef Pagination = ({int page, int pageSize});

class PaginationController {
  final Signal<Pagination> _state = signal((page: 1, pageSize: 9));

  Pagination get value => _state.value;

  ReadonlySignal<Pagination> get state => _state;

  void update({int? page, int? pageSize}) {
    final currentState = _state.value;
    _state.value = (
      page: page ?? currentState.page,
      pageSize: pageSize ?? currentState.pageSize,
    );
  }

  void reset() {
    _state.value = (page: 1, pageSize: 9);
  }

  void dispose() => _state.dispose();
}

final paginationController = PaginationController();

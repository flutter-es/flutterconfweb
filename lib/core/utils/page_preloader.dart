import 'package:signals/signals.dart';

class PagePreloader {
  static Future<void> preload(
    List<FutureSignal<dynamic>> signals, {
    Duration timeout = const Duration(seconds: 10),
  }) async {
    await Future.wait(
      signals.map((signal) {
        return signal.future
            .catchError((_) => null)
            .timeout(timeout, onTimeout: () => null);
      }),
    );
  }
}

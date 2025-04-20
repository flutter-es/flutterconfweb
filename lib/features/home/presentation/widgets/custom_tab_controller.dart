import 'package:flutter/material.dart';

class CustomTabController {
  CustomTabController({required this.vsync, required this.length});

  final TickerProvider vsync;
  final int length;

  TabController? tabController;

  final valueController = ValueNotifier<int>(0);

  void animateTo(int index) {
    tabController?.animateTo(index);
    valueController.value = index;
  }

  TabController build() {
    return tabController ??= TabController(length: length, vsync: vsync);
  }

  ValueNotifier<int> mobile() {
    return valueController;
  }
}

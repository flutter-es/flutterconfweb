import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/utils/page_preloader.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/features/schedule/presentation/view_model/schedule_view_model.dart';
import 'package:flutter_conf_latam/features/schedule/presentation/widgets/schedule_main.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    unawaited(
      analyticsRepository.value.logScreenView(screenName: 'sessions_page'),
    );
    unawaited(_preloadData());
  }

  Future<void> _preloadData() async {
    await PagePreloader.preload([scheduleSignal]);
    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        if (_isLoading)
          const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          )
        else
          SliverList(
            delegate: SliverChildListDelegate([
              const ScheduleMain(),
              const Footer(),
            ]),
          ),
      ],
    );
  }
}

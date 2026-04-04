import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/utils/page_preloader.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/features/venue/presentation/view_model/venue_view_model.dart';
import 'package:flutter_conf_latam/features/venue/presentation/widgets/venue_main.dart';
import 'package:flutter_conf_latam/features/venue/presentation/widgets/venue_place.dart';
import 'package:flutter_conf_latam/features/venue/presentation/widgets/venue_tip_extra.dart';

class VenuePage extends StatefulWidget {
  const VenuePage({super.key});

  @override
  State<VenuePage> createState() => _VenuePageState();
}

class _VenuePageState extends State<VenuePage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    unawaited(
      analyticsRepository.value.logScreenView(screenName: 'venue_page'),
    );
    unawaited(_preloadData());
  }

  Future<void> _preloadData() async {
    await PagePreloader.preload([venueSignal]);
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
              const VenueMain(),
              const VenuePlace(),
              const VenueTipExtra(),
              const Footer(),
            ]),
          ),
      ],
    );
  }
}

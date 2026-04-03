import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/features/venue/presentation/widgets/venue_main.dart';
import 'package:flutter_conf_latam/features/venue/presentation/widgets/venue_place.dart';
import 'package:flutter_conf_latam/features/venue/presentation/widgets/venue_tip_extra.dart';

class VenuePage extends StatefulWidget {
  const VenuePage({super.key});

  @override
  State<VenuePage> createState() => _VenuePageState();
}

class _VenuePageState extends State<VenuePage> {
  @override
  void initState() {
    super.initState();
    unawaited(
      analyticsRepository.value.logScreenView(screenName: 'venue_page'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
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

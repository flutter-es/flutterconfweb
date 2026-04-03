import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/core/widgets/container/pricing_container.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_collaborations.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_features.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_gallery.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    unawaited(analyticsRepository.value.logScreenView(screenName: 'home_page'));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            const HomeMain(),
            const HomeFeatures(),
            const HomeGallery(),
            const HomeCollaborations(type: .sponsor),
            const HomeCollaborations(type: .speaker),
            const PricingContainer(),
            /*
            // TODO(FV): Temp
            const HomeVenue(),
            const HomeNovelties(),
            const HomeSpeakers(),
            const HomeSponsors(),
            const HomeFaq(),
            */
            const Footer(),
          ]),
        ),
      ],
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/utils/page_preloader.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/core/widgets/container/pricing_container.dart';
import 'package:flutter_conf_latam/features/home/presentation/view_model/home_view_model.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_collaborations.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_features.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_gallery.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_main.dart';
import 'package:flutter_conf_latam/features/pricing/presentation/view_model/pricing_view_model.dart';
import 'package:flutter_conf_latam/features/speakers/presentation/view_model/speakers_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    unawaited(analyticsRepository.value.logScreenView(screenName: 'home_page'));
    unawaited(_preloadData());
  }

  Future<void> _preloadData() async {
    await PagePreloader.preload([
      sponsorsSignal,
      faqListSignal,
      galleryPreviewSignal,
      speakersRandomSignal,
      pricingSignal,
    ]);

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

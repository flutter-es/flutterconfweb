import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/utils/page_preloader.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/core/widgets/container/page_loading.dart';
import 'package:flutter_conf_latam/core/widgets/container/pricing_container.dart';
import 'package:flutter_conf_latam/features/home/presentation/view_model/home_view_model.dart';
import 'package:flutter_conf_latam/features/home/presentation/view_model/organizers_view_model.dart';
import 'package:flutter_conf_latam/features/home/presentation/view_model/pricing_view_model.dart';
import 'package:flutter_conf_latam/features/home/presentation/view_model/venue_view_model.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_collaborations.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_contact.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_faq.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_features.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_gallery.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_main.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_organizers_communities.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_organizers_people.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_sponsors.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_venue.dart';

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
      pricingSignal,
      venueSignal,
      organizersDataSignal,
      communitiesSignal,
      faqListSignal,
    ]);

    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) return const PageLoading();

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            const HomeMain(),
            const HomeFeatures(),
            const HomeVenue(),
            const PricingContainer(),
            const HomeSponsors(),
            const HomeCollaborations(type: .sponsor),
            const HomeCollaborations(type: .speaker),
            const OrganizersPeople(),
            const OrganizersCommunities(),
            const HomeGallery(),
            const HomeFaq(),
            const HomeContact(),
            const Footer(),
          ]),
        ),
      ],
    );
  }
}

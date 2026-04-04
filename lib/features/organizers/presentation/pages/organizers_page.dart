import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/utils/page_preloader.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/features/organizers/presentation/view_model/organizers_view_model.dart';
import 'package:flutter_conf_latam/features/organizers/presentation/widgets/organizers_communities.dart';
import 'package:flutter_conf_latam/features/organizers/presentation/widgets/organizers_people.dart';

class OrganizersPage extends StatefulWidget {
  const OrganizersPage({super.key});

  @override
  State<OrganizersPage> createState() => _OrganizersPageState();
}

class _OrganizersPageState extends State<OrganizersPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    unawaited(
      analyticsRepository.value.logScreenView(screenName: 'organizers_page'),
    );
    unawaited(_preloadData());
  }

  Future<void> _preloadData() async {
    await PagePreloader.preload([organizersDataSignal, communitiesSignal]);
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
              const OrganizersPeople(),
              const OrganizersCommunities(),
              const Footer(),
            ]),
          ),
      ],
    );
  }
}

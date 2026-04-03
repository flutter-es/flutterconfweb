import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/features/organizers/presentation/widgets/organizers_communities.dart';
import 'package:flutter_conf_latam/features/organizers/presentation/widgets/organizers_people.dart';

class OrganizersPage extends StatefulWidget {
  const OrganizersPage({super.key});

  @override
  State<OrganizersPage> createState() => _OrganizersPageState();
}

class _OrganizersPageState extends State<OrganizersPage> {
  @override
  void initState() {
    super.initState();
    unawaited(
      analyticsRepository.value.logScreenView(screenName: 'organizers_page'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
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

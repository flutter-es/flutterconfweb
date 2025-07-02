import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';

class SessionsPage extends StatefulWidget {
  const SessionsPage({super.key});

  @override
  State<SessionsPage> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  final analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    analytics.logScreenView(screenName: 'sessions_page');
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            const Footer(),
          ]),
        ),
      ],
    );
  }
}

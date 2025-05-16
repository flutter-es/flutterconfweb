import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/features/contact/presentation/widgets/contact_about.dart';
import 'package:flutter_conf_latam/features/contact/presentation/widgets/contact_extra.dart';
import 'package:flutter_conf_latam/features/contact/presentation/widgets/contact_main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactPage extends ConsumerStatefulWidget {
  const ContactPage({super.key});
  static const String route = '/contact';

  @override
  ConsumerState<ContactPage> createState() => _ContactPageState(); 
}

class _ContactPageState extends ConsumerState<ContactPage> {
  final analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    analytics.logScreenView(screenName: 'contact_page');
  }
   @override
    Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            const ContactMain(),
            const ContactAbout(),
            const ContactExtra(),
            const Footer(),
          ]),
        ),
      ],
    );
  }
}

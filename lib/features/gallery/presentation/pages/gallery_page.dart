import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GalleryPage extends ConsumerStatefulWidget {
  const GalleryPage({super.key});

  @override
  ConsumerState<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends ConsumerState<GalleryPage> {
  final analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    analytics.logScreenView(screenName: 'gallery_page');
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(delegate: SliverChildListDelegate([const Footer()])),
      ],
    );
  }
}

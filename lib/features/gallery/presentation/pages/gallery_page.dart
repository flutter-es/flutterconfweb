import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/utils/page_preloader.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/features/gallery/presentation/view_model/gallery_view_model.dart';
import 'package:flutter_conf_latam/features/gallery/presentation/widgets/gallery_list.dart';
import 'package:flutter_conf_latam/features/gallery/presentation/widgets/gallery_main.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    unawaited(
      analyticsRepository.value.logScreenView(screenName: 'gallery_page'),
    );
    unawaited(_preloadData());
  }

  Future<void> _preloadData() async {
    await PagePreloader.preload([galleryDataSignal]);
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
              const GalleryMain(),
              const GalleryList(),
              const Footer(),
            ]),
          ),
      ],
    );
  }
}

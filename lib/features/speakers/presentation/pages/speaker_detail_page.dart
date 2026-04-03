import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/core/widgets/container/dialog_container.dart';
import 'package:flutter_conf_latam/features/speakers/presentation/widgets/speaker_detail_main.dart';

class SpeakerDetailPage extends StatefulWidget {
  const SpeakerDetailPage({required this.id, super.key});

  final String id;

  @override
  State<SpeakerDetailPage> createState() => _SpeakerDetailPageState();
}

class _SpeakerDetailPageState extends State<SpeakerDetailPage> {
  @override
  void initState() {
    super.initState();
    unawaited(
      analyticsRepository.value.logScreenView(
        screenName: 'speakers_detail_page',
        screenClass: 'speaker_${widget.id}',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DialogContainer(
      child: SpeakerDetailMain(id: widget.id),
    );
  }
}

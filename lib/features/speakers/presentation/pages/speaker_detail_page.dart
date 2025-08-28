import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/widgets/dialog/dialog_container.dart';
import 'package:flutter_conf_latam/features/speakers/presentation/widgets/speaker_detail_main.dart';

class SpeakerDetailPage extends StatefulWidget {
  const SpeakerDetailPage({required this.id, super.key});

  final String id;

  @override
  State<SpeakerDetailPage> createState() => _SpeakerDetailPageState();
}

class _SpeakerDetailPageState extends State<SpeakerDetailPage> {
  final analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    analytics.logScreenView(
      screenName: 'speakers_detail_page',
      parameters: <String, Object>{'speakerId': widget.id},
    );
  }

  @override
  Widget build(BuildContext context) {
    return DialogContainer(
      child: SpeakerDetailMain(id: widget.id),
    );
  }
}

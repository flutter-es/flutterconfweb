import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/icons/circle_icon.dart';
import 'package:flutter_conf_latam/features/speakers/presentation/widgets/speaker_detail_main.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';

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
    return Material(
      color: FlutterLatamColors.darkBlue,
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            SpeakerDetailMain(id: widget.id),
            const _CloseButton(),
          ],
        ),
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      top: switch (context.screenSize) {
        ScreenSize.extraLarge || ScreenSize.large => 20,
        ScreenSize.normal || ScreenSize.small => 0,
      },
      child: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: const CircleIcon(
          child: Icon(Icons.close, color: FlutterLatamColors.white),
        ),
      ),
    );
  }
}

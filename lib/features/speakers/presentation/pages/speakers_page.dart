import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/providers/speakers_providers.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpeakersPage extends ConsumerWidget {

  static const String route = '/speakers';

  const SpeakersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appLoc = ref.watch(appLocalizationsProvider);
    final speakers = ref.read(speakersProvider);

    return Center(
      child: Text('Speakers'),
    );
  }
}
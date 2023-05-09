import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SpeakersContainer extends StatelessWidget {
  const SpeakersContainer({super.key});

  static const height = 600.0;

  static const title = 'speakers_container';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.blue[400],
      alignment: Alignment.center,
      child: Text(
        AppLocalizations.of(context)!.menu(title),
      ),
    );
  }
}

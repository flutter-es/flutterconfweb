import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  static const height = 600.0;

  static const title = 'home_container';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.grey[400],
      alignment: Alignment.center,
      child: Text(
        AppLocalizations.of(context)!.menu(title),
      ),
    );
  }
}

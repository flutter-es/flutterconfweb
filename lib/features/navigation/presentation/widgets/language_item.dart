import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/styles/colors.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    required this.title,
    required this.isActive,
    required this.onTap,
    required this.locale,
    super.key,
  });

  final String title;
  final bool isActive;
  final ValueSetter<Locale> onTap;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: InkWell(
        onTap: () => onTap(locale),
        child: Text(
          title.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.white : FlutterLatamColors.darkBlue,
          ),
        ),
      ),
    );
  }
}

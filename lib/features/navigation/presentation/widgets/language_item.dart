import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    required this.title,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  final String title;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: InkWell(
        onTap: onTap,
      ),
    );
  }
}

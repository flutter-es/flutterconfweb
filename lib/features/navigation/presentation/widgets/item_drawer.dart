import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/features/navigation/data/models/tab_navigation_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemDrawer extends ConsumerWidget {
  const ItemDrawer({required this.item, required this.onTap, super.key});

  final VoidCallback onTap;
  final TabNavigationItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const borderRadius = BorderRadius.all(Radius.circular(60));

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: SizedBox(
          height: 60,
          child: InkWell(
            onTap: onTap,
            borderRadius: borderRadius,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration:
                  item.isSelected!
                      ? const BoxDecoration(color: Colors.white12)
                      : null,
              child: Text(
                item.label,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: item.isSelected! ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

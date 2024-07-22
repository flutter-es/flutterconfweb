import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/navigation/data/models/tab_navigation_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemDrawer extends ConsumerWidget {
  const ItemDrawer({
    required this.item,
    required this.onTap,
    super.key,
  });

  final Function onTap;
  final TabNavigationItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const borderRaidus = BorderRadius.all(
      Radius.circular(60.0),
    );

    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: ClipRRect(
        borderRadius: borderRaidus,
        child: SizedBox(
          height: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
              onTap();
            },
            borderRadius: borderRaidus,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              decoration: item.isSelected!
                  ? const BoxDecoration(
                      color: Colors.white12,
                    )
                  : null,
              child: Text(
                item.label,
                style: TextStyle(
                  fontSize: 22.0,
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

import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/ui/entities/home_section.dart';
import 'package:flutter_conf_colombia/ui/ui_extensions.dart';

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({
    required this.section,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final HomeSection section;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
              decoration: isSelected
                  ? const BoxDecoration(
                      color: Colors.white12,
                    )
                  : null,
              child: Text(
                context.menu(section.title),
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

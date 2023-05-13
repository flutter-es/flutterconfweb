import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/styles/flutter_conf_latam_icons_icons.dart';

class CircleRoundIconButton extends StatelessWidget {

  final IconData icon;
  final String label;
  final Color labelColor;
  final Color circleColor;
  final Color iconColor;
  final Color backgroundColor;
  final FontWeight labelWeight;
  final Function onTap;
  final double iconSize;
  final double fontSize;

  const CircleRoundIconButton({
    super.key, 
    required this.icon,
    required this.label, 
    required this.labelColor, 
    required this.circleColor, 
    required this.iconColor, 
    required this.backgroundColor,
    required this.labelWeight,
    required this.onTap,
    this.iconSize = 30,
    this.fontSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(100),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 75,
              height: 75,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: circleColor,
              ),
              child: Icon(icon, color: iconColor, size: iconSize),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Text(label, style: TextStyle(color: labelColor, fontSize: fontSize, fontWeight: labelWeight)),
            )
          ],    
        ),
      ),
    );
  }
}

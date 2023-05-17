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
  Function? onTap;
  final double iconSize;
  final double fontSize;
  final double iconPadding;

  CircleRoundIconButton({
    super.key, 
    required this.icon,
    required this.label, 
    required this.labelColor, 
    required this.circleColor, 
    required this.iconColor, 
    required this.backgroundColor,
    required this.labelWeight,
    this.iconSize = 30,
    this.fontSize = 30,
    this.iconPadding = 20,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onTap == null ? 0.25 : 1,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap != null ? () {
            onTap!();
          } : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(iconPadding),
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
      ),
    );
  }
}

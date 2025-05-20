import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/styles/colors.dart';

part 'style/fcl_button_style.dart';

part 'style/fcl_button_style_primary.dart';

part 'style/fcl_button_style_secondary.dart';

enum ButtonVariant { primary, secondary }

enum ButtonSize { small, large }

class FclButton extends StatelessWidget {
  const FclButton.primary({
    required this.label,
    required this.onPressed,
    required this.buttonSize,
    this.iconAlignment = IconAlignment.start,
    this.icon,
    super.key,
  }) : variant = ButtonVariant.primary;

  const FclButton.secondary({
    required this.label,
    required this.onPressed,
    required this.buttonSize,
    this.iconAlignment = IconAlignment.start,
    this.icon,
    super.key,
  }) : variant = ButtonVariant.secondary;

  final String label;
  final ButtonVariant variant;
  final ButtonSize buttonSize;
  final IconAlignment iconAlignment;
  final VoidCallback? onPressed;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: switch (variant) {
        ButtonVariant.primary => _FclButtonStylePrimary(buttonSize: buttonSize),
        ButtonVariant.secondary => _FclButtonStyleSecondary(
          buttonSize: buttonSize,
        ),
      },
      onPressed: onPressed,
      child: Row(
        spacing: 12,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: switch (iconAlignment) {
          IconAlignment.start => TextDirection.ltr,
          IconAlignment.end => TextDirection.rtl,
        },
        children: <Widget>[
          if (icon != null) icon!,
          Flexible(child: Text(label, textAlign: TextAlign.center)),
        ],
      ),
    );
  }
}

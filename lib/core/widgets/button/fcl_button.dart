import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/theme.dart';

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
    this.iconAlignment = .start,
    this.icon,
    super.key,
  }) : variant = .primary;

  const FclButton.secondary({
    required this.label,
    required this.onPressed,
    required this.buttonSize,
    this.iconAlignment = .start,
    this.icon,
    super.key,
  }) : variant = .secondary;

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
        .primary => _FclButtonStylePrimary(
          buttonSize: buttonSize,
          theme: context.theme,
        ),
        .secondary => _FclButtonStyleSecondary(
          buttonSize: buttonSize,
          theme: context.theme,
        ),
      },
      onPressed: onPressed,
      child: Row(
        spacing: 12,
        mainAxisSize: .min,
        mainAxisAlignment: .center,
        textDirection: switch (iconAlignment) {
          .start => .ltr,
          .end => .rtl,
        },
        children: <Widget>[
          ?icon,
          Flexible(child: Text(label, textAlign: .center)),
        ],
      ),
    );
  }
}

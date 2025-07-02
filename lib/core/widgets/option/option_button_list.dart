import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/widgets/button/fcl_button.dart';

class OptionButtonList extends StatelessWidget {
  const OptionButtonList({
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    super.key,
  });

  final List<String> options;
  final int selectedValue;
  final ValueSetter<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (final (index, item) in options.indexed)
          if (index == selectedValue)
            FclButton.primary(
              label: item,
              onPressed: () => onChanged(index),
              buttonSize: ButtonSize.small,
            )
          else
            FclButton.secondary(
              label: item,
              onPressed: () => onChanged(index),
              buttonSize: ButtonSize.small,
            ),
      ],
    );
  }
}

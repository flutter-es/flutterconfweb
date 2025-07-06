import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/routes/helpers/navigation_item_model.dart';
import 'package:flutter_conf_latam/styles/core/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubMenuButton extends HookWidget {
  const SubMenuButton({
    required this.tabItem,
    required this.onSelect,
    super.key,
  });

  final NavigationItemModel tabItem;
  final ValueSetter<NavigationItemModel> onSelect;

  @override
  Widget build(BuildContext context) {
    assert(tabItem.subMenus != null, 'You must set a sub menu list');
    assert(tabItem.subMenus!.isNotEmpty, 'The sub menu list must not be empty');

    final isOpened = useState(false);

    return PopupMenuButton(
      position: PopupMenuPosition.under,
      color: FlutterLatamColors.darkBlue,
      offset: context.isMobileFromResponsive
          ? const Offset(40, 0)
          : const Offset(-40, 0),
      constraints: const BoxConstraints(maxWidth: 200),
      menuPadding: const EdgeInsets.symmetric(horizontal: 24),
      onOpened: () => isOpened.value = true,
      onCanceled: () => isOpened.value = false,
      popUpAnimationStyle: const AnimationStyle(
        curve: Easing.emphasizedDecelerate,
        duration: Duration(seconds: 1),
      ),
      onSelected: (value) {
        isOpened.value = false;
        final subMenuList = [
          for (final element in tabItem.subMenus!)
            element.copyWith(isSelected: element == value),
        ];

        onSelect(tabItem.copyWith(subMenus: subMenuList));
      },
      itemBuilder: (_) {
        return tabItem.subMenus!.map((item) {
          return PopupMenuItem(
            value: item,
            child: Text(
              item.label,
              style: _setMenuTextStyle(isSelected: item.isSelected),
            ),
          );
        }).toList();
      },
      child: Row(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FittedBox(
            child: Text(
              tabItem.label,
              style: _setMenuTextStyle(isSelected: tabItem.isSelected),
            ),
          ),
          SvgPicture.asset(
            isOpened.value
                ? Assets.images.icons.arrowUp
                : Assets.images.icons.arrowDown,
          ),
        ],
      ),
    );
  }

  TextStyle _setMenuTextStyle({bool isSelected = false}) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      color: FlutterLatamColors.white,
      fontWeight: switch (isSelected) {
        true => FontWeight.w600,
        false => FontWeight.w400,
      },
    );
  }
}

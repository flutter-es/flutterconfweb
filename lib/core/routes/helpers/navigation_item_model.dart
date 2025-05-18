import 'package:equatable/equatable.dart';

class NavigationItemModel extends Equatable {
  const NavigationItemModel({
    required this.label,
    required this.route,
    this.isSelected = false,
    this.visible = true,
  });

  final String label;
  final String route;
  final bool isSelected;
  final bool visible;

  NavigationItemModel copyWith({bool? isSelected}) {
    return NavigationItemModel(
      label: label,
      route: route,
      isSelected: isSelected ?? this.isSelected,
      visible: visible,
    );
  }

  @override
  List<Object?> get props => [route, isSelected, visible];
}

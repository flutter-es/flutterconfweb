import 'package:equatable/equatable.dart';

class NavigationItemModel extends Equatable {
  const NavigationItemModel({
    required this.label,
    required this.route,
    this.isSelected = false,
    this.display = true,
  });

  final String label;
  final String route;
  final bool isSelected;
  final bool display;

  NavigationItemModel copyWith({bool? isSelected}) {
    return NavigationItemModel(
      label: label,
      route: route,
      isSelected: isSelected ?? this.isSelected,
      display: display,
    );
  }

  @override
  List<Object?> get props => [label, route, isSelected, display];
}

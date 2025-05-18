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

  NavigationItemModel copyWith({
    String? label,
    String? route,
    bool? isSelected,
    bool? display,
  }) {
    return NavigationItemModel(
      label: label ?? this.label,
      route: route ?? this.route,
      isSelected: isSelected ?? this.isSelected,
      display: display ?? this.display,
    );
  }

  @override
  List<Object?> get props => [label, route, isSelected, display];
}

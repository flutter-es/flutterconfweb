class TabNavigationItem {
  const TabNavigationItem({
    required this.label,
    required this.route,
    this.isSelected = false,
    this.display = true,
  });

  final String label;
  final String route;
  final bool? isSelected;
  final bool? display;

  TabNavigationItem copyWith({
    String? label,
    String? route,
    bool? isSelected,
    bool? display,
  }) {
    return TabNavigationItem(
      label: label ?? this.label,
      route: route ?? this.route,
      isSelected: isSelected ?? this.isSelected,
      display: display ?? this.display,
    );
  }
}

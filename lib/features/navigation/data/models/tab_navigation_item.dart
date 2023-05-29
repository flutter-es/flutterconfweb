class TabNavigationItem {

  const TabNavigationItem({
    required this.label,
    required this.route,
    this.isSelected = false,
  });

  final String label;
  final String route;
  final bool? isSelected;

  TabNavigationItem copyWith({
      String? label,
      String? route,
      bool? isSelected
    }) {
      return TabNavigationItem(
        label: label ?? this.label, 
        route: route ?? this.route,
        isSelected: isSelected ?? this.isSelected 
    );
  }
}
